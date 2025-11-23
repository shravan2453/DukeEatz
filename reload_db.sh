#!/bin/bash
# Script to reload the DukeEatz database

echo "🛑 Stopping any active connections..."
TERMINATED=$(psql -d postgres -t -c "SELECT COUNT(*) FROM pg_stat_activity WHERE datname = 'dukeeatz' AND pid <> pg_backend_pid();" 2>/dev/null | xargs)
if [ "$TERMINATED" -gt "0" ]; then
    echo "   Terminating $TERMINATED active connection(s)..."
    psql -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dukeeatz' AND pid <> pg_backend_pid();" 2>&1
    sleep 1  # Give it a moment to disconnect
else
    echo "   No active connections found."
fi

echo "🗑️  Dropping existing database..."
psql -d postgres -c "DROP DATABASE IF EXISTS dukeeatz;" 2>&1

echo "✨ Creating fresh database..."
psql -d postgres -c "CREATE DATABASE dukeeatz;" 2>&1

echo "📋 Running schema (create.sql)..."
psql -d dukeeatz -f create.sql 2>&1 | grep -E "(CREATE|ERROR)" | head -10

echo "📦 Loading data (load.sql)..."
psql -d dukeeatz -f load.sql 2>&1 | tail -5

echo "✅ Verifying data..."
VENDOR_COUNT=$(psql -d dukeeatz -t -c "SELECT COUNT(*) FROM vendors;" 2>/dev/null | xargs)
echo "   Found $VENDOR_COUNT vendors in database"

if [ "$VENDOR_COUNT" -gt "0" ]; then
    echo "✅ Database reloaded successfully!"
else
    echo "⚠️  Warning: No vendors found. Check for errors above."
fi


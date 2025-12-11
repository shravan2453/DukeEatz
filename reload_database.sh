#!/bin/bash
# Script to reload the DukeEatz database

echo "🛑 Terminating active connections to dukeeatz database..."
psql -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dukeeatz' AND pid <> pg_backend_pid();"

echo "🗑️  Dropping existing database..."
psql -d postgres -c "DROP DATABASE IF EXISTS dukeeatz;"

echo "✨ Creating fresh database..."
psql -d postgres -c "CREATE DATABASE dukeeatz;"

echo "📋 Running schema (create.sql)..."
psql -d dukeeatz -f create.sql > /dev/null 2>&1
echo "   ✓ Schema created"

echo "📦 Loading vendor data (load.sql)..."
psql -d dukeeatz -f load.sql > /dev/null 2>&1
echo "   ✓ Vendor data loaded"

echo "🍽️  Loading menu items (load_menu.sql)..."
psql -d dukeeatz -f load_menu.sql > /dev/null 2>&1
echo "   ✓ Menu items loaded"

echo ""
echo "✅ Verifying data..."
VENDOR_COUNT=$(psql -d dukeeatz -t -c "SELECT COUNT(*) FROM vendors;" | xargs)
MENU_COUNT=$(psql -d dukeeatz -t -c "SELECT COUNT(*) FROM menu_items;" | xargs)
echo "   Vendors: $VENDOR_COUNT"
echo "   Menu Items: $MENU_COUNT"

if [ "$VENDOR_COUNT" -gt "0" ] && [ "$MENU_COUNT" -gt "0" ]; then
    echo ""
    echo "✅ Database reloaded successfully!"
else
    echo ""
    echo "⚠️  Warning: Some data may be missing. Check for errors above."
fi

/**
 * Check if a vendor is currently open based on operating hours
 * @param {Object} operatingHours - Operating hours object from vendor
 * @returns {boolean} - True if vendor is open, false otherwise
 */
export const isVendorOpen = (operatingHours) => {
  if (!operatingHours || typeof operatingHours !== 'object') {
    return false;
  }

  // Get current day and time
  const now = new Date();
  const dayNames = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'];
  const currentDay = dayNames[now.getDay()];
  const currentTime = now.getHours() * 60 + now.getMinutes(); // Time in minutes since midnight

  // Get today's hours
  const todayHours = operatingHours[currentDay];

  // If no hours for today, vendor is closed
  if (!todayHours || todayHours === null) {
    return false;
  }

  // Check each meal period (breakfast, lunch, dinner, brunch, etc.)
  for (const [meal, timeRange] of Object.entries(todayHours)) {
    if (!timeRange || timeRange === 'closed' || timeRange === null) {
      continue;
    }

    // Handle "close" as end of day (11:59pm)
    const normalizedTimeRange = timeRange.toLowerCase().replace(/\s+/g, ' ').trim();
    
    // Parse time range (e.g., "6:45am-11:00am" or "4:00pm-close" or "4:00pm - close")
    // More flexible regex to handle spaces and "close"
    let timeMatch = normalizedTimeRange.match(/(\d{1,2}):(\d{2})\s*(am|pm)\s*-\s*(\d{1,2}):(\d{2})\s*(am|pm)/i);
    
    if (!timeMatch) {
      // Try to match with "close" at the end
      timeMatch = normalizedTimeRange.match(/(\d{1,2}):(\d{2})\s*(am|pm)\s*-\s*close/i);
      if (timeMatch) {
        const [, startHour, startMin, startPeriod] = timeMatch;
        
        // Convert to 24-hour format and then to minutes
        let startMinutes = parseInt(startHour) * 60 + parseInt(startMin);
        if (startPeriod.toLowerCase() === 'pm' && parseInt(startHour) !== 12) {
          startMinutes += 12 * 60;
        } else if (startPeriod.toLowerCase() === 'am' && parseInt(startHour) === 12) {
          startMinutes -= 12 * 60;
        }

        // "close" means end of day (11:59pm = 1439 minutes)
        const endMinutes = 23 * 60 + 59;

        // Check if current time is within this range
        if (currentTime >= startMinutes && currentTime <= endMinutes) {
          return true;
        }
      }
    } else {
      const [, startHour, startMin, startPeriod, endHour, endMin, endPeriod] = timeMatch;
      
      // Convert to 24-hour format and then to minutes
      let startMinutes = parseInt(startHour) * 60 + parseInt(startMin);
      if (startPeriod.toLowerCase() === 'pm' && parseInt(startHour) !== 12) {
        startMinutes += 12 * 60;
      } else if (startPeriod.toLowerCase() === 'am' && parseInt(startHour) === 12) {
        startMinutes -= 12 * 60;
      }

      let endMinutes = parseInt(endHour) * 60 + parseInt(endMin);
      if (endPeriod.toLowerCase() === 'pm' && parseInt(endHour) !== 12) {
        endMinutes += 12 * 60;
      } else if (endPeriod.toLowerCase() === 'am' && parseInt(endHour) === 12) {
        endMinutes -= 12 * 60;
      }

      // Check if current time is within this range
      if (currentTime >= startMinutes && currentTime <= endMinutes) {
        return true;
      }
    }
  }

  return false;
};

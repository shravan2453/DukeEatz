// Utility function to format text: capitalize and replace underscores
export const formatText = (text) => {
  if (!text) return '';
  return text
    .split('_')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
    .join(' ');
};

// Format array of texts
export const formatTextArray = (textArray) => {
  if (!textArray || !Array.isArray(textArray)) return [];
  return textArray.map(formatText);
};


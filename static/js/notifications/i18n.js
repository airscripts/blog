function getTranslation(language, key) {
  if (!Object.keys(dictionary).includes(language)) language = "en";

  return dictionary[language][key]
    ? dictionary[language][key]
    : "Oops, missing translation.";
}

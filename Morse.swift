var englishText = "this is a secret message"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

// Dictionary with letters as keys and morse code counterparts as values
var letterToMorse: [String: String] = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  ".": ".-.-.-",
  "!": "-.-.--",
  "?": "..--..",
  ",": "--..--"
]
var morseText = ""

// Loop through each character in englishText
for element in englishText {
  if let morseChar = letterToMorse["\(element)"]{
  morseText += morseChar + " "
} else {
  morseText += "   "
}
}

// Decoding a Message
var decodedMessage = ""
// morseCodeArray will store individual morse code letters from secretMessage
var morseCodeArray = [String]()
var currMorse = ""

// Loop through each character in secretMorse
for char in secretMessage {
  if char != " " {
    currMorse.append(char)
  } else {
    switch currMorse {
  case "": 
    currMorse += " "
  case " ":
    morseCodeArray.append(" ")
    currMorse = ""
  default: 
    morseCodeArray.append(currMorse)
    currMorse = ""
    }
  }
}

morseCodeArray.append(currMorse)

// Empty dictionary. This will hold morse code values as Keys and their english counter parts as Values
var morseToLetter = [String: String]()

// Iterate through letterToMorse dictionary, add the keys as values and the values as keys to the morseToLetter dictionary
for (letter,morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}

// Go through each element in morseCodeArray and find the text value via the morseToLetter dictionary
for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue] {
    decodedMessage.append(letterChar)
  } else {
    decodedMessage.append(" ")
  }
}

print(decodedMessage)

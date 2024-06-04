UNIT WordInitialization;
INTERFACE
  USES
    OutputResult;  
  PROCEDURE LowerCase(VAR Ch: CHAR);
  FUNCTION LettersLimiters(Ch: CHAR): BOOLEAN;
  PROCEDURE SkipCharacters(VAR F: TEXT; VAR Ch: CHAR);
  PROCEDURE WritingInString(VAR Ch: CHAR; VAR F: TEXT; VAR Str: STRING);  
IMPLEMENTATION

  PROCEDURE LowerCase(VAR Ch: CHAR);
  BEGIN
    CASE Ch OF
      'A': Ch := 'a';
      'B': Ch := 'b';
      'C': Ch := 'c';
      'D': Ch := 'd';
      'E': Ch := 'e';
      'G': Ch := 'g';
      'H': Ch := 'h';
      'I': Ch := 'i';
      'J': Ch := 'j';
      'K': Ch := 'k';
      'L': Ch := 'l';
      'M': Ch := 'm';
      'N': Ch := 'n';
      'O': Ch := 'o';
      'P': Ch := 'p';
      'Q': Ch := 'q';
      'R': Ch := 'r';
      'S': Ch := 's';
      'T': Ch := 't';
      'U': Ch := 'u';
      'V': Ch := 'v';
      'W': Ch := 'w';
      'X': Ch := 'x';
      'Y': Ch := 'y';
      'Z': Ch := 'z';
      'À': Ch := 'à';
      'Á': Ch := 'á';
      'Â': Ch := 'â';
      'Ã': Ch := 'ã';
      'Ä': Ch := 'ä';
      'Å': Ch := 'å';
      '¨': Ch := '¸';
      'Æ': Ch := 'æ';
      'Ç': Ch := 'ç';
      'È': Ch := 'è';
      'É': Ch := 'é';
      'Ê': Ch := 'ê';
      'Ë': Ch := 'ë';
      'Ì': Ch := 'ì';
      'Í': Ch := 'í';
      'Î': Ch := 'î';
      'Ï': Ch := 'ï';
      'Ð': Ch := 'ð';
      'Ñ': Ch := 'ñ';
      'Ò': Ch := 'ò';
      'Ó': Ch := 'ó';
      'Ô': Ch := 'ô';
      'Õ': Ch := 'õ';
      'Ö': Ch := 'ö';
      '×': Ch := '÷';
      'Ø': Ch := 'ø';
      'Ù': Ch := 'ù';
      'Ú': Ch := 'ú';
      'Û': Ch := 'û';
      'Ü': Ch := 'ü';
      'Ý': Ch := 'ý';
      'Þ': Ch := 'þ';
      'ß': Ch := 'ÿ'
    END
  END;

  FUNCTION LettersLimiters(Ch: CHAR): BOOLEAN;{ÏÐÎÂÅÐßÅÒ ÒÎÒ ËÈ ÑÈÌÂÎË}
  BEGIN
    IF ((Ch >= 'A') AND (Ch <='Z')) OR ((Ch >= 'a') AND (Ch <= 'z')) OR ((Ch >= 'À') AND (Ch <= 'ß')) OR ((Ch >= 'à') AND (Ch <= 'ÿ')) OR (Ch = '-') OR (Ch = '¸') OR (Ch = '¨') 
    THEN
      LettersLimiters := TRUE
    ELSE
      LettersLimiters := FALSE
  END;

  PROCEDURE SkipCharacters(VAR F: TEXT; VAR Ch: CHAR); {ÑÊÈÏÀÅÒ ÞÇËÅÑÑ ÑÈÌÂÎËÛ}                            
  BEGIN 
    WHILE (LettersLimiters(Ch) = FALSE) AND (NOT EOF(F)) AND (NOT EOLN(F))
    DO
      READ(F, Ch);  
  END;

  PROCEDURE WritingInString(VAR Ch: CHAR; VAR F: TEXT; VAR Str: STRING); //çàïèñü â ìàññèâ ñïèñêà
  BEGIN
    Str := '';
    WHILE(LettersLimiters(Ch) = TRUE) AND (NOT EOLN(F)) AND (NOT EOF(F))
    DO
       BEGIN
          LowerCase(Ch);
          Str := Str + Ch;
          IF (NOT EOLN(F)) AND (NOT EOF(F))
          THEN  
            READ(F, Ch);  
          IF (EOLN(F)) AND (LettersLimiters(Ch) = TRUE) AND (NOT EOF(F))   
          THEN
            BEGIN
              LowerCase(Ch);
              Str := Str + Ch;
            END 
       END;
    IF (LettersLimiters(Ch) = TRUE) AND (EOLN(F))
    THEN
      BEGIN
        LowerCase(Ch);
        Str := Str + Ch;
      END        
  END;
BEGIN
END.

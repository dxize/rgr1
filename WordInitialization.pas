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
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�';
      '�': Ch := '�'
    END
  END;

  FUNCTION LettersLimiters(Ch: CHAR): BOOLEAN;{��������� ��� �� ������}
  BEGIN
    IF ((Ch >= 'A') AND (Ch <='Z')) OR ((Ch >= 'a') AND (Ch <= 'z')) OR ((Ch >= '�') AND (Ch <= '�')) OR ((Ch >= '�') AND (Ch <= '�')) OR (Ch = '-') OR (Ch = '�') OR (Ch = '�') 
    THEN
      LettersLimiters := TRUE
    ELSE
      LettersLimiters := FALSE
  END;

  PROCEDURE SkipCharacters(VAR F: TEXT; VAR Ch: CHAR); {������� ������ �������}                            
  BEGIN 
    WHILE (LettersLimiters(Ch) = FALSE) AND (NOT EOF(F)) AND (NOT EOLN(F))
    DO
      READ(F, Ch);  
  END;

  PROCEDURE WritingInString(VAR Ch: CHAR; VAR F: TEXT; VAR Str: STRING); //������ � ������ ������
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

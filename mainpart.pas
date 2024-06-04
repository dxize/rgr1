UNIT MainPart;
INTERFACE
  USES
    WordInitialization, Sort, OutputResult;  
  PROCEDURE MainAlgorithm;
IMPLEMENTATION

  PROCEDURE MainAlgorithm;
  VAR
    Ch1: CHAR;
  BEGIN
    Ptr1 := NIL;
    WHILE NOT EOF(WW)
    DO
    BEGIN
      WHILE NOT EOLN(WW)
      DO
        BEGIN  
          READ(WW, Ch1);
          SkipCharacters(WW, Ch1);                          
          WritingInString(Ch1, WW, Data); 
          IF Data[1] <> '-'
          THEN  
            Insert(Ptr1); 
        END; 
      IF NOT EOF(WW)
      THEN
        READLN(WW)
    END
  END;

BEGIN
END.

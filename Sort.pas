UNIT Sort;
INTERFACE
  USES
    OutputResult;                 
  PROCEDURE Insert(VAR Ptr1: Tree);
  PROCEDURE MysteriousSymbol(VAR Ptr: Tree);
  PROCEDURE SearchEquality(VAR Ptr: Tree); 
IMPLEMENTATION
 
  PROCEDURE Insert(VAR Ptr1: Tree); {ÒÓÚËÓ‚Í‡}
  BEGIN
    IF Ptr1 = NIL
    THEN
      BEGIN
        NEW(Ptr1);
        Ptr1^.Word := Data;
        Ptr1^.Count := 1;
        Ptr1^.LLink := NIL;
        Ptr1^.RLink := NIL
      END
    ELSE   
      IF Ptr1^.Word[1] > Data[1]     
      THEN
        IF (Ptr1^.Word[1] <> '∏') AND (Data[1] <> '∏') 
        THEN                      
          IF Ptr1^.Word[1]> Data[1]
          THEN
            Insert(Ptr1^.LLink) 
          ELSE
            Insert(Ptr1^.RLink)
        ELSE
          MysteriousSymbol(Ptr1)
      ELSE
        IF Ptr1^.Word[1] < Data[1]
        THEN
          IF (Ptr1^.Word[1] <> '∏') AND (Data[1] <> '∏') 
          THEN                      
            IF Ptr1^.Word[1]> Data[1]
            THEN
              Insert(Ptr1^.LLink) 
            ELSE
              Insert(Ptr1^.RLink)
          ELSE  
            MysteriousSymbol(Ptr1)    
        ELSE   {Ptr1^.Word[1] = Ptr2^.Word[1]} 
          SearchEquality(Ptr1)  
  END;

  PROCEDURE MysteriousSymbol(VAR Ptr: Tree);    {œ–Œ¬≈– ¿ Õ¿ —»Ã¬ŒÀ ∏}
  VAR
    A, B: CHAR;
  BEGIN
    A := Ptr^.Word[i];  
    B := Data[i];
    IF (A = '∏') AND (B < 'Ê') AND (B <> '∏') 
    THEN
      Insert(Ptr^.LLink)
    ELSE
      IF (A < 'Ê') AND (B = '∏') AND (A <> '∏')
      THEN
        Insert(Ptr^.RLink)
      ELSE
        IF (A >= 'Ê') AND (B = '∏')
        THEN         
          Insert(Ptr^.LLink) 
        ELSE
          IF (A = '∏') AND (B >= 'Ê')
          THEN
            Insert(Ptr^.RLink) 
 
  END; 

  PROCEDURE SearchEquality(VAR Ptr: Tree);
  VAR
    Result: CHAR;
  BEGIN
    i := 1;
    Result := '0';
    WHILE (Result = '0')  
    DO
      BEGIN
        IF (Ptr^.Word[i] = Data[i]) AND (LENGTH(Ptr^.Word) = i) AND (LENGTH(Data) > i) 
        THEN
          BEGIN
            Result := '2'; 
            Insert(Ptr^.RLink) 
          END;
        IF (Ptr^.Word[i] = Data[i]) AND (LENGTH(Ptr^.Word) > i) AND (LENGTH(Data) = i) 
        THEN
          BEGIN
            Result := '2';
            Insert(Ptr^.LLink)
          END;
        IF (Ptr^.Word[i] <> Data[i]) 
        THEN {Ptr1^.Word < Ptr2^.Word}
          BEGIN
            Result := '1';
            IF (Ptr^.Word[i] <> '∏') AND (Data[i] <> '∏') 
            THEN                      
              IF Ptr^.Word[i] > Data[i]
              THEN
                Insert(Ptr^.LLink) 
              ELSE
                Insert(Ptr^.RLink)
            ELSE
              MysteriousSymbol(Ptr)
          END;
        IF (LENGTH(Ptr^.Word) = i) AND (LENGTH(Data) = i) AND (Ptr^.Word[i] = Data[i])  
        THEN
          Result := '3';  
        IF Result = '0'
        THEN
          i := i + 1
      END; {WHILE}
    IF Result = '3'
    THEN
      Ptr^.Count := Ptr^.Count + 1;  
  END;  

BEGIN
END.

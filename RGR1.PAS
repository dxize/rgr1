PROGRAM CountWordsV1(INPUT, OUTPUT);
USES       
  Sort, OutputResult, MainPart, WordInitialization;    
BEGIN 
  ASSIGN(WW, 'WW.txt');
  RESET(WW);
  ASSIGN(SR, 'SaveResults.txt');
  WHILE EOLN(WW) AND (NOT EOF(WW))
  DO
    READLN(WW);
  MainAlgorithm;
  REWRITE(SR);
  PrintWords(Ptr1);
  CLOSE(SR);
  CLOSE(WW)                            
END.

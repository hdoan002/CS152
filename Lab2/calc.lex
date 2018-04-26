/*
 *
 *
 */

%{
  int currLine = 1; currPos = 1;
  int numNumbers = 0;
  int numOp = 0;
  int numParens = 0;
  int numEquals = 0;
%}

digits                   [0-9]

%%
"-"                      { currPos += yyleng; numOp++; return MINUS; }
"+"                      { currPos += yyleng; numOp++; return PLUS; }
"*"                      { currPos += yyleng; numOp++; return MULT; }
"/"                      { currPos += yyleng; numOp++; return DIV; }
"("                      { currPos += yyleng; numParens++; return L_PAREN; }
")"                      { currPos += yyleng; numParens++; return R_PAREN; }
"="                      { currPos += yyleng; numEquals++; return EQUAL; }



"\n"                     {currLine++; currPos = 1; return END;}
[ \t]+                   {/* ignore spaces */ currPos += yyleng;}
.                        { printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0); }

%%

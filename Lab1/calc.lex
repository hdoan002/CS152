/* 
 * Description: Calculator
 */

digits     [0-9]

%{
int integers = 0, operators = 0;
int paren = 0, equals = 0;
%}

%%
"+"        ++operators;
"-"        ++operators;
"*"        ++operators;
"/"        ++operators;
"="        ++equals;
"("        ++paren;
")"        ++paren;
{digits}   ++integers;

[ \t]+     {/*ignore spaces */}
"\n"       {/*ignore newlines*/}

.          printf("Unexpected character encountered\n"); exit(0);


%%
int main(int argc, char ** argv)
{
  if(argc >= 2){
    yyin = fopen(argv[1], "r");
    if(yyin == NULL) {
      yyin = stdin;
    }
  }
  else {
    yyin = stdin;
  }

  yylex();

  printf("The number of integers encountered: %d\n", integers);
  printf("The number of operators encountered: %d\n", operators);
  printf("The number of parentheses encountered: %d\n", paren);
  printf("The number of equal signs encountered: %d\n", equals);
}

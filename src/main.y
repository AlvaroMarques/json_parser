

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}
%token START_JSON
%token STOP_JSON
%token TWO_DOTS
%token TEXT
%token NUM 
%token COMMA
%token START_LIST
%token END_LIST
%%

LIST: EXP COMMA LIST {printf("hello\n");} 
	| EXP ;
	
EXP: TEXT
	| NUM;


%%
//JSON: 
//	| START_JSON TEXT TWO_DOTS JSON STOP_JSON {printf("Dic expression\n");}
//	| START_JSON TEXT TWO_DOTS LIST STOP_JSON {printf("Dic expression\n");}
//	| START_JSON STOP_JSON  {printf("Hey\n");};
void yyerror(char *s) {
}

int main() {
  yyparse();
    return 0;

}

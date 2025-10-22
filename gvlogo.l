%{
#include <stdio.h>
#include <stdlib.h>
#include "gvlogo.tab.h"

extern void yyerror(const char* s);
%}

%%
[0-9]+       { yylval.num = atof(yytext); return NUMBER; }
end	         { return END; }
=            { return EQUALS; }
\+           { return PLUS; }
-            { return MINUS; }
\*           { return MULT; }
\/           { return DIV; }
;	         { return SEMI; }
\$[A-Z]	     { yylval.var = yytext[1] - 65; return VARIABLE; }
penup        { return PENUP; }
pendown      { return  PENDOWN; }
print        { return PRINT; }
save path    { return SAVE PATH; }
color        { return COLOR; }
clear        { return CLEAR; }
turn         { return TURN; }
move         { return MOVE; }
goto         { return GOTO; }
where        { return WHERE; }
sep          { return **not sure**; }

[ \t\r\n]			;
.			{ yyerror("Lexing Syntax error.\n"); } 

%%

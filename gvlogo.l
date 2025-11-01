%{
#include <stdio.h>
#include <stdlib.h>
#include "gvlogo.tab.h"

extern void yyerror(const char* s);
%}

%%
[0-9]+          { yylval.f = atof(yytext); return NUMBER; }
end	            { return END; }
=               { return EQUALS; }
\+              { return PLUS; }
-               { return MINUS; }
\*              { return MULT; }
\/              { return DIV; }
;	            { return SEMI; }
\$[A-Z]	        { yylval.v = yytext[1] - 65; return VARIABLE; }
penup           { return PENUP; }
pendown         { return PENDOWN; }
save            { return SAVE; }
[a-zA-Z]+\.bmp  { return PATH; }
color           { return COLOR; }
clear           { return CLEAR; }
turn            { return TURN; }
move            { return MOVE; }
goto            { return GOTO; }
where           { return WHERE; }
sep             { return NOT_SURE; }

[ \t\r\n]+			;
.			{ yyerror("Lexing Syntax error.\n"); } 

%%

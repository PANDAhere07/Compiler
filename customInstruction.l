%{
#include <stdio.h>
float a = 0, b = 0, c = 0;
int token_count = 0, muladdxy_flag = 0;
%}

%%

[ \t\n]+              ;
a[0-9]+               { sscanf(yytext, "a%f", &a); printf("Token: %s (a value)\n", yytext); token_count++; }
b[0-9]+               { sscanf(yytext, "b%f", &b); printf("Token: %s (b value)\n", yytext); token_count++; }
c[0-9]+               { sscanf(yytext, "c%f", &c); printf("Token: %s (c value)\n", yytext); token_count++; }
muladdxy              { printf("Token: %s (Custom Instruction: MULADDXY)\n", yytext); token_count++; muladdxy_flag = 1; }
"+"|"-"|"*"|"/"|"="   { printf("Token: %s (Operator)\n", yytext); token_count++; }
[0-9]+                { printf("Token: %s (Number)\n", yytext); token_count++; }
.                     { printf("Token: %s (Unknown)\n", yytext); token_count++; }

%%

int yywrap() { return 1; }

int main() {
    char input[256];
    printf("Enter input (e.g., 'a3 b4 c2 muladdxy'):\n");
    fgets(input, sizeof(input), stdin);
    yy_scan_string(input);
    yylex();

    if (a != 0 && b != 0 && c != 0) {
        float z = a * b + c;
        if (muladdxy_flag) {
            printf("Assembly (Using MULADDXY):\n");
            printf("    MULADDXY r4, r1, r2, r3  # r4 = a * b + c\n");
        } else {
            printf("Standard Assembly:\n");
            printf("    MUL r5, r1, r2   # r5 = a * b\n");
            printf("    ADD r4, r5, r3   # r4 = a * b + c\n");
        }
        printf("Result: z = %.2f\n", z);
    } else {
        printf("Missing a, b, or c values.\n");
    }

    printf("Total tokens: %d\n", token_count);
    return 0;
}

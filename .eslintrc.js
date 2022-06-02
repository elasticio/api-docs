module.exports = {
    "parser":  "@typescript-eslint/parser",
    "extends": [
        "standard",
        "plugin:security/recommended",
        "plugin:@typescript-eslint/recommended"
    ],
    "parserOptions":  {
        "ecmaVersion":  2018,
        "sourceType":  "module",
        "ecmaFeatures": {
            "impliedStrict": true
        }
    },
    "plugins": [
        "security"
    ],
    "rules": {
        "@typescript-eslint/indent": ["error", 4],
        "indent": "off",
        "@typescript-eslint/class-name-casing": "error",
        "@typescript-eslint/ban-ts-ignore": "error",
        "@typescript-eslint/no-explicit-any": "off",
        "no-useless-constructor": "off",
        "@typescript-eslint/no-useless-constructor": "error",
        "@typescript-eslint/no-angle-bracket-type-assertion": 0,
        "@typescript-eslint/explicit-function-return-type": "off",
        "@typescript-eslint/explicit-member-accessibility": "off",
        "@typescript-eslint/no-var-requires": "off",
        "@typescript-eslint/consistent-type-assertions": 0,
        "semi": [
            "error",
            "always"
        ],
        "indent": [
            "error",
            4,
            { "SwitchCase": 1 }
        ],
        "max-len": [
            "warn",
            120,
            4,
            {
                "ignoreUrls": true,
                "ignoreTemplateLiterals": true
            }
        ],
        "space-before-function-paren": [
            "warn",
            {
                "anonymous": "always",
                "named": "never",
                "asyncArrow": "always"
            }
        ],
        "curly": [
            2,
            "all"
        ],
        "brace-style": [
            "error",
            "1tbs",
            {
                "allowSingleLine": false
            }
        ]
    }
};

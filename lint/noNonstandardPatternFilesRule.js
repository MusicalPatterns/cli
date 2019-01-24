"use strict";
/* tslint:disable */
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
exports.__esModule = true;
var Lint = require("tslint");
var tslint_1 = require("tslint");
var Rule = /** @class */ (function (_super) {
    __extends(Rule, _super);
    function Rule() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Rule.prototype.apply = function (sourceFile) {
        if (sourceFile.fileName.includes('src/material/') && filenameIsNotAllowed(sourceFile.fileName, materialsFilenames)) {
            return [new tslint_1.RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName)];
        }
        if (sourceFile.fileName.includes('src/metadata/') && filenameIsNotAllowed(sourceFile.fileName, metadataFilenames)) {
            return [new tslint_1.RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName)];
        }
        if (sourceFile.fileName.includes('src/spec/') && filenameIsNotAllowed(sourceFile.fileName, specFilenames)) {
            return [new tslint_1.RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName)];
        }
        return [];
    };
    /* tslint:disable:object-literal-sort-keys */
    Rule.metadata = {
        ruleName: 'no-nonstandard-pattern-files',
        description: Lint.Utils.dedent(templateObject_1 || (templateObject_1 = __makeTemplateObject(["\n            Disallows files inside a pattern's src folder which do not match a set of standard file names."], ["\n            Disallows files inside a pattern's src folder which do not match a set of standard file names."]))),
        rationale: Lint.Utils.dedent(templateObject_2 || (templateObject_2 = __makeTemplateObject(["\n            Preserve the standardization of patterns."], ["\n            Preserve the standardization of patterns."]))),
        optionsDescription: 'None.',
        options: {},
        optionExamples: [true],
        type: 'functionality',
        typescriptOnly: false,
        hasFix: false
    };
    Rule.FAILURE_STRING = 'Keep the pattern files standardized. Only certain filenames are allowed in certain folders.';
    return Rule;
}(Lint.Rules.AbstractRule));
exports.Rule = Rule;
var filenameIsNotAllowed = function (fileName, allowedFilenames) {
    return allowedFilenames.every(function (potentialFilename) {
        return !fileName.includes(potentialFilename + ".ts") && !fileName.includes(potentialFilename + "/");
    });
};
var sharedFilenames = [
    'constants',
    'index',
    'indexForTest',
    'types',
];
var materialsFilenames = sharedFilenames.concat([
    'blocks',
    'entities',
    'notes',
    'parts',
    'pieces',
    'scales',
    'scalars',
    'renderings',
    'segments',
    'wholes',
]);
var metadataFilenames = sharedFilenames.concat([
    'html.d',
    'metadatas',
    'posts',
]);
var specFilenames = sharedFilenames.concat([
    'attributes',
    'data',
    'descriptions',
    'initial',
    'orders',
    'presets',
    'specs',
    'validation',
]);
var templateObject_1, templateObject_2;

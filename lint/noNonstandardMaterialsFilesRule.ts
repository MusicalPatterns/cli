/* tslint:disable */

import { RuleFailure } from 'tslint'
import * as Lint from 'tslint'
import * as ts from 'typescript'

export class Rule extends Lint.Rules.AbstractRule {
    /* tslint:disable:object-literal-sort-keys */
    public static metadata: Lint.IRuleMetadata = {
        ruleName: 'no-nonstandard-materials-files',
        description: Lint.Utils.dedent`
            Disallows files inside a pattern's materials folder which do not match a set of standard file names.`,
        rationale: Lint.Utils.dedent`
            Preserve the focus of the materials folder.`,
        optionsDescription: 'None.',
        options: {},
        optionExamples: [ true ],
        type: 'functionality',
        typescriptOnly: false,
        hasFix: false,
    }

    public static FAILURE_STRING = 'Keep the materials folder standardized. Only certain filenames are allowed here.'

    public apply(sourceFile: ts.SourceFile): Lint.RuleFailure[] {
        console.log(sourceFile.fileName)
        const materialsFilenames: string[] = [
            'blocks',
            'constants',
            'entities',
            'index',
            'indexForTest',
            'notes',
            'parts',
            'pieces',
            'scales',
            'scalars',
            'renderings',
            'segments',
            'types',
            'wholes',
        ]
        if (sourceFile.fileName.includes('src/materials/') && materialsFilenames.includes(sourceFile.fileName)) {
            return []
        }

        return [ new RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName)]
    }
}

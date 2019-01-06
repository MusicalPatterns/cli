/* tslint:disable */

import * as Lint from 'tslint'
import { RuleFailure } from 'tslint'
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
        if (sourceFile.fileName.includes('src/materials/') && filenameIsNotAllowed(sourceFile.fileName)) {
            return [ new RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName) ]
        }

        return []
    }
}

const filenameIsNotAllowed: (fileName: string) => boolean =
    (fileName: string): boolean => {
        const allowedMaterialsFilenames: string[] = [
            'blocks.ts',
            'constants.ts',
            'entities.ts',
            'index.ts',
            'indexForTest.ts',
            'notes.ts',
            'parts.ts',
            'pieces.ts',
            'scales.ts',
            'scalars.ts',
            'renderings.ts',
            'segments.ts',
            'types.ts',
            'wholes.ts',
        ]

        return allowedMaterialsFilenames.every((potentialFilename: string): boolean => {
            return !fileName.includes(potentialFilename)
        })
    }

/* tslint:disable */

import * as Lint from 'tslint'
import { RuleFailure } from 'tslint'
import * as ts from 'typescript'

export class Rule extends Lint.Rules.AbstractRule {
    /* tslint:disable object-literal-sort-keys */
    public static metadata: Lint.IRuleMetadata = {
        ruleName: 'no-nonstandard-pattern-files',
        description: Lint.Utils.dedent`
            Disallows files inside a pattern's src folder which do not match a set of standard file names.`,
        rationale: Lint.Utils.dedent`
            Preserve the standardization of patterns.`,
        optionsDescription: 'None.',
        options: {},
        optionExamples: [ true ],
        type: 'functionality',
        typescriptOnly: false,
        hasFix: false,
    }

    public static FAILURE_STRING = 'Keep the pattern files standardized. Only certain filenames are allowed in certain folders.'

    public apply(sourceFile: ts.SourceFile): Lint.RuleFailure[] {
        if (!sourceFile.fileName.includes('main/patterns/') || !sourceFile.fileName.includes('src/')) {
            return []
        }

        if (filenameIsNotAllowed(sourceFile.fileName, allowedFilenames)) {
            return [ new RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName) ]
        }

        return []
    }
}

const filenameIsNotAllowed: (fileName: string, allowedFilenames: string[]) => boolean =
    (fileName: string, allowedFilenames: string[]): boolean => {
        return allowedFilenames.every((potentialFilename: string): boolean => {
            return !fileName.includes(`${potentialFilename}.ts`) && !fileName.includes(`${potentialFilename}/`)
        })
    }

const allowedFilenames: string[] = [
    'src/constants',
    'src/index',
    'src/indexForTest',
    'src/nominal',
    'src/patterns',
    'src/start',
    'src/types',
    'src/material/blocks',
    'src/material/contours',
    'src/material/entities',
    'src/material/features',
    'src/material/notes',
    'src/material/pieces',
    'src/material/scales',
    'src/material/material',
    'src/material/scalars',
    'src/material/renderings',
    'src/material/segments',
    'src/material/wholes',
    'src/material/constants',
    'src/material/custom',
    'src/material/index',
    'src/material/indexForTest',
    'src/material/types',
    'src/metadata/html.d',
    'src/metadata/metadatas',
    'src/metadata/posts',
    'src/metadata/constants',
    'src/metadata/custom',
    'src/metadata/index',
    'src/metadata/indexForTest',
    'src/metadata/types',
    'src/spec/configurations',
    'src/spec/constraints',
    'src/spec/descriptions',
    'src/spec/initial',
    'src/spec/orders',
    'src/spec/presets',
    'src/spec/spec',
    'src/spec/specs',
    'src/spec/validation',
    'src/spec/constants',
    'src/spec/custom',
    'src/spec/index',
    'src/spec/indexForTest',
    'src/spec/types',
]

/* tslint:disable */

import * as Lint from 'tslint'
import { RuleFailure } from 'tslint'
import * as ts from 'typescript'

export class Rule extends Lint.Rules.AbstractRule {
    /* tslint:disable:object-literal-sort-keys */
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
        if (!sourceFile.fileName.includes('main/patterns/pattern-')) {
            return []
        }

        if (sourceFile.fileName.includes('src/material/') && filenameIsNotAllowed(sourceFile.fileName, materialsFilenames)) {
            return [ new RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName) ]
        }

        if (sourceFile.fileName.includes('src/metadata/') && filenameIsNotAllowed(sourceFile.fileName, metadataFilenames)) {
            return [ new RuleFailure(sourceFile, 0, 0, Rule.FAILURE_STRING, this.ruleName) ]
        }

        if (sourceFile.fileName.includes('src/spec/') && filenameIsNotAllowed(sourceFile.fileName, specFilenames)) {
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

const sharedFilenames: string[] = [
    'constants',
    'index',
    'indexForTest',
    'types',
]

const materialsFilenames: string[] = sharedFilenames.concat([
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
])

const metadataFilenames: string[] = sharedFilenames.concat([
    'html.d',
    'metadatas',
    'posts',
])

const specFilenames: string[] = sharedFilenames.concat([
    'attributes',
    'data',
    'descriptions',
    'initial',
    'orders',
    'presets',
    'specs',
    'validation',
])

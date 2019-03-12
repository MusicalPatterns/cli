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
            return !fileName.includes(potentialFilename)
        })
    }

const allowedFilenames: string[] = [
    'src/constants.ts',
    'src/index.ts',
    'src/indexForTest.ts',
    'src/nominal.ts',
    'src/patterns.ts',
    'src/start.ts',
    'src/types.ts',
    'src/type/',
    'src/material/blocks.ts',
    'src/material/block/',
    'src/material/contours.ts',
    'src/material/contour/',
    'src/material/entities.ts',
    'src/material/entity/',
    'src/material/features.ts',
    'src/material/feature/',
    'src/material/notes.ts',
    'src/material/note/',
    'src/material/pieces.ts',
    'src/material/piece/',
    'src/material/scales.ts',
    'src/material/scale/',
    'src/material/materials.ts',
    'src/material/material/',
    'src/material/scalars.ts',
    'src/material/scalar/',
    'src/material/renderings.ts',
    'src/material/rendering/',
    'src/material/segments.ts',
    'src/material/segment/',
    'src/material/wholes.ts',
    'src/material/whole/',
    'src/material/constants.ts',
    'src/material/customs.ts',
    'src/material/custom/',
    'src/material/index.ts',
    'src/material/indexForTest.ts',
    'src/material/types.ts',
    'src/material/type/',
    'src/metadata/html.d.ts',
    'src/metadata/metadatas.ts',
    'src/metadata/metadata/',
    'src/metadata/posts.ts',
    'src/metadata/post/',
    'src/metadata/constants.ts',
    'src/metadata/customs.ts',
    'src/metadata/custom/',
    'src/metadata/index.ts',
    'src/metadata/indexForTest.ts',
    'src/metadata/types.ts',
    'src/metadata/type/',
    'src/spec/configurations.ts',
    'src/spec/configuration/',
    'src/spec/constraints.ts',
    'src/spec/constraint/',
    'src/spec/descriptions.ts',
    'src/spec/description/',
    'src/spec/initials.ts',
    'src/spec/initial/',
    'src/spec/orders.ts',
    'src/spec/order/',
    'src/spec/presets.ts',
    'src/spec/preset/',
    'src/spec/specs.ts',
    'src/spec/spec/',
    'src/spec/validations.ts',
    'src/spec/validation/',
    'src/spec/constants.ts',
    'src/spec/customs.ts',
    'src/spec/custom/',
    'src/spec/index.ts',
    'src/spec/indexForTest.ts',
    'src/spec/types.ts',
    'src/spec/type/',
]

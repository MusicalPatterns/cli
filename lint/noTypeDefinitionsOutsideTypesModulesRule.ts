/* tslint:disable */

import * as Lint from 'tslint'
import * as ts from 'typescript'

export class Rule extends Lint.Rules.AbstractRule {
    /* tslint:disable object-literal-sort-keys */
    public static metadata: Lint.IRuleMetadata = {
        ruleName: 'no-type-definitions-outside-types-modules',
        description: Lint.Utils.dedent`
            Disallows defining types outside of dedicated modules named 'types.ts'.`,
        rationale: Lint.Utils.dedent`
            This should make it easier to discover existing types and keep them healthy.`,
        optionsDescription: 'None.',
        options: {},
        optionExamples: [ true ],
        type: 'functionality',
        typescriptOnly: false,
        hasFix: false,
    }

    public static FAILURE_STRING = 'Do not declare types here. Please move them to the nearest "types.ts" module.'

    public apply(sourceFile: ts.SourceFile): Lint.RuleFailure[] {
        if (sourceFile.fileName.includes('types.ts') ||
            sourceFile.fileName.includes('type/') ||
            sourceFile.fileName.includes('nominals.ts')) {
            return []
        }

        return this.applyWithFunction(sourceFile, walk, this.ruleArguments)
    }
}

function walk(ctx: Lint.WalkContext<string[]>) {
    ts.forEachChild(ctx.sourceFile, (node: ts.Node): void => {
        const text: string = node.getText(ctx.sourceFile)
        const trimmedText: string = text.replace(/^\s+|\s+$/gm, '')
        const lines: string[] = trimmedText.split('\n')
        lines.forEach((line: string) => {
            if (line.startsWith('type ') || line.startsWith('interface ') || line.startsWith('enum ')) {
                ctx.addFailureAtNode(node, Rule.FAILURE_STRING)
            }
        })
    })
}

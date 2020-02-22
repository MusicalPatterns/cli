describe('when jasmine has no way to configure its exit code to not be error even when it prints SUCCESS on empty test suite', (): void => {
    it('has at least one test', (): void => {
        expect(true)
            .toBeTruthy()
    })
})

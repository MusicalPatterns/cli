describe('when jasmine has no way to configure its exit code to not be error even when it prints SUCCESS on empty test suite', () => {
    it('has at least one test', () => {
        expect(true)
            .toBeTruthy()
    })
})

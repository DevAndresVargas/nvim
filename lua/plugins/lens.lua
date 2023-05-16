return {
    'camspiers/lens.vim',
    dependencies = {
        'camspiers/animate.vim',
    },
    config = function()
        require "alpha.lens"
    end
}

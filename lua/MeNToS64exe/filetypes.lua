-- linker filetype (*.ld)
vim.filetype.add({
    extension = {
        ld = "ld",
        lds = "ld",
    },

    filename = {
        ["linker.ld"] = "ld",
        ["link.ld"] = "ld",
    },

    pattern = {
        [".*%.ld%.in"] = "ld",
        [".*linker.*%.ld"] = "ld",
    },
})

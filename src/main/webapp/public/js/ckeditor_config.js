/**
 * CKEditor配置文件
 */
CKEDITOR.editorConfig = function (config) {
    config.toolbar = 'Full';

    config.toolbar_Full =
        [
            ['Source', '-', 'Preview'],
            ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'Scayt'],
            ['Undo', 'Redo', '-', 'SelectAll', 'RemoveFormat'],
            ['BidiLtr', 'BidiRtl'],
            '/',
            ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
            ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
            ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
            ['Link', 'Unlink', 'Anchor'],
            ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'],
            '/',
            ['Styles', 'Format', 'Font', 'FontSize'],
            ['TextColor', 'BGColor'],
            ['Maximize', 'ShowBlocks', '-']
        ];
};

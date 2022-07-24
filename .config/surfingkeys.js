// an example to create a new mapping `ctrl-y`
api.mapkey('<ctrl-y>', 'Show me the money', function() {
    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map('gt', 'T');

// an example to remove mapkey `Ctrl-i`
api.unmap('<ctrl-i>');
api.unmap('R');
api.unmap('E');
api.unmap('/');
api.unmap('x');
api.unmap('X');
api.unmap('o');
api.unmap('O');
api.unmap('b');
api.unmap('B');
api.unmap('F');
api.unmap('H');
api.unmap('gg');
api.unmap('G');
api.unmap('yy');
api.unmap('gt');
api.unmap('gT');
api.unmap('gu');
api.unmap('gU');
api.unmap('g0');
api.unmap('g$');
api.unmap('t');
api.unmap('T');
api.unmap('p');
api.unmap('P');
api.unmap('n');
api.unmap('N');
api.unmap('gE');
api.unmap('ge');
api.unmap('g');
api.unmap('e');
api.unmap('z');
api.unmap('y');
api.unmap('yy');

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>

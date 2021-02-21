{'pdoMenu' | snippet: [
    'parents' => 69,
    'level' => 1,
    'where' => ['template' => 2 ],
    'tplOuter' => '@INLINE <ul class="subcategory-sidebar "><span class="subcategory-sidebar__title">Категории</span>{$wrapper}</ul>',
    'tpl' => '@INLINE <li  class="subcategory-sidebar__item {$classnames}"><a href="{$link}">{$menutitle}</a></li>',
]}
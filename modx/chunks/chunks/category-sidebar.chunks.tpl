{'pdoMenu' | snippet: [
    'parents' => 69,
    'level' => 1,
    'limit' => 4,
    'where' => ['template' => 2 ],
    'tplOuter' => '@INLINE <ul class="category-sidebar"><span class="category-sidebar__title">Категории</span>{$wrapper}</ul>',
    'tpl' => '@INLINE <li  class="category-sidebar__item"><a href="{$link}">{$menutitle}</a></li>',
    'countChildren' => 1
]}
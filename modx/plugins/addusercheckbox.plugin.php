<?php
switch ($modx->event->name) {
    case "OnMODXInit":
        $map = array(
            'modUser' => array(
                'fields' => array(
                    'new_checkbox' => 0,
                ),
                'fieldMeta' => array(
                    'new_checkbox' => array(
                        'dbtype' => 'tinyint',
                        'precision' => '1',
                        'phptype' => 'boolean',
                        'attributes' => 'unsigned',
                        'null' => false,
                        'default' => 0,
                    ),
                ),
            ),
            'modUserProfile' => array(
                'fields' => array(
                    'user_document1' => '',
                    'user_document2' => '',
                    'user_document3' => '',
                    'user_document4' => '',
                    'user_contract' => ''
                ),
                'fieldMeta' => array(
                    'user_document1' => array(
                        'dbtype' => 'varchar',
                        'precision' => '255',
                        'phptype' => 'string',
                        'null' => false,
                    ),
                    'user_document2' => array(
                        'dbtype' => 'varchar',
                        'precision' => '255',
                        'phptype' => 'string',
                        'null' => false,
                    ),
                    'user_document3' => array(
                        'dbtype' => 'varchar',
                        'precision' => '255',
                        'phptype' => 'string',
                        'null' => false,
                    ),
                    'user_document4' => array(
                        'dbtype' => 'varchar',
                        'precision' => '255',
                        'phptype' => 'string',
                        'null' => false,
                    ),
                    'user_contract' => array(
                        'dbtype' => 'varchar',
                        'precision' => '255',
                        'phptype' => 'string',
                        'null' => false,
                    )
                ),
            ),
        );

        foreach ($map as $class => $data) {
            $modx->loadClass($class);

            foreach ($data as $tmp => $fields) {
                if ($tmp == 'fields') {
                    foreach ($fields as $field => $value) {
                        foreach (array('fields', 'fieldMeta', 'indexes') as $key) {
                            if (isset($data[$key][$field])) {
                                $modx->map[$class][$key][$field] = $data[$key][$field];
                            }
                        }
                    }
                } elseif ($tmp == 'composites' || $tmp == 'aggregates') {
                    foreach ($fields as $alias => $relation) {
                        if (!isset($modx->map[$class][$tmp][$alias])) {
                            $modx->map[$class][$tmp][$alias] = $relation;
                        }
                    }
                }
            }
        }
        break;
    
    case "OnUserFormPrerender":
        if (!isset($user) || $user->get('id') < 1) {return;}
        // $profile = $user->Profile;
        // $extended = $profile->get('extended');
        // unset($extended['files']);
        // $profile->set('extended', $extended);
        // $profile->save();
        // $user->save();

        if (!$modx->getCount('modPlugin', array('name' => 'AjaxManager', 'disabled' => false))) {
            $data['new_checkbox'] = $user->new_checkbox ? 'true' : 'false';
            
            $data['user_document1'] = $user->Profile->user_document1 ? htmlspecialchars($user->Profile->user_document1) : null;
            $data['user_document2'] = $user->Profile->user_document2 ? htmlspecialchars($user->Profile->user_document2) : null;
            $data['user_document3'] = $user->Profile->user_document3 ? htmlspecialchars($user->Profile->user_document3) : null;
            $data['user_document4'] = $user->Profile->user_document4 ? htmlspecialchars($user->Profile->user_document4) : null;
            $data['user_contract'] = $user->Profile->user_contract ? htmlspecialchars($user->Profile->user_contract) : null;
            
            if($data['user_document1'] !== null) {
                $tpl1 = "<h4>Свидетельство о регистрации компании</h4>
                        <a href='" . $data['user_document1'] . "' download>
                            <img src='" . $data['user_document1'] . "'  width='200'/>
                        </a>";
            }
            if($data['user_document2'] !== null) {
                $tpl2 = "<h4>Свидетельство о регистрации компании</h4>
                        <a href='" . $data['user_document2'] . "' download>
                            <img src='" . $data['user_document2'] . "'  width='200'/>
                        </a>";
            }
            if($data['user_document3'] !== null) {
                $tpl3 = "<h4>Свидетельство о регистрации компании</h4>
                        <a href='" . $data['user_document3'] . "' download>
                            <img src='" . $data['user_document3'] . "'  width='200'/>
                        </a>";
            }
            if($data['user_document4'] !== null) {
                $tpl4 = "<h4>Свидетельство о регистрации компании</h4>
                        <a href='" . $data['user_document4'] . "' download>
                            <img src='" . $data['user_document4'] . "'  width='200'/>
                        </a>";
            }
            if($data['user_contract'] !== null) {
                $tpl5 = "<a href='" . $data['user_contract'] . "' download>
                            Скачать договор
                        </a>";
            }
            
            $modx->controller->addHtml("
                <script type='text/javascript'>
                Ext.ComponentMgr.onAvailable('modx-user-tabs', function () {
                    this.on('beforerender', function () {
                        var thisTab = this.items.items[3];
                        var rightCol = this.items.items[0].items.items[0].items.items[1];
                        thisTab.title = 'Реквизиты';
                        this.add({
                            xtype: 'panel',
                            title: 'Документы',
                            border: false,
                            frame: true,
                            width: 400,
                            height: 300,
                            title: 'Документы',
                            items: [
                                {
                                    layout: 'column',
                                    title: 'Загруженные документы пользователя',
                                    width: '100%',
                                    items: [
                                        {
                                            
                                            border: false,
                                            frame: false,
                                            columnWidth: .25,
                                            xtype: 'displayfield',
                                            name: 'document_1',
                                            id: 'document_1',
                                            title: 'test',
                                            cls: 'user__row',
                                            value: `{$tpl1}`
                                        },
                                        {
                                            layout: 'column',
                                            border: false,
                                            frame: false,
                                            columnWidth: .25,
                                            xtype: 'displayfield',
                                            name: 'document_2',
                                            id: 'document_2',
                                            title: 'test',
                                            cls: 'user__row',
                                            value: `{$tpl2}`
                                        },
                                        {
                                            layout: 'column',
                                            border: false,
                                            frame: false,
                                            columnWidth: .25,
                                            xtype: 'displayfield',
                                            name: 'document_3',
                                            id: 'document_3',
                                            title: 'test',
                                            cls: 'user__row',
                                            value: `{$tpl3}`
                                        },
                                        {
                                            layout: 'column',
                                            border: false,
                                            frame: false,
                                            columnWidth: .25,
                                            xtype: 'displayfield',
                                            name: 'document_4',
                                            id: 'document_4',
                                            title: 'test',
                                            cls: 'user__row',
                                            value: `{$tpl4}`
                                        }
                                    ]
                                },
                                {
                                    layout: 'column',
                                    title: 'Подписанный договор',
                                    width: '100%',
                                    items: [
                                        {
                                            
                                            border: false,
                                            frame: false,
                                            columnWidth: 1,
                                            xtype: 'displayfield',
                                            name: 'document_contract',
                                            id: 'document_contract',
                                            title: 'test',
                                            cls: 'user__row',
                                            value: `{$tpl5}`
                                        }
                                    ]
                                }
                            ]
                        })
                        rightCol.items.insert(3, 'modx-user-new-checkbox', new Ext.form.Checkbox({
                            id: 'modx-user-new-checkbox',
                            name: 'new_checkbox',
                            hideLabel: true,
                            boxLabel: 'Подтвержденный пользователь',
                            description: 'Описание...',
                            xtype: 'xcheckbox',
                            inputValue: 1,
                            listeners: {
                                beforerender: function(that) {
                                    that.hiddenField = new Ext.Element(document.createElement('input')).set({
                                        type: 'hidden',
                                        name: that.name,
                                        value: 0,
                                    });
                                },
                                afterrender: function(that) {
                                    that.el.insertHtml('beforeBegin', that.hiddenField.dom.outerHTML);
                                },
                            },
                            checked: {$data['new_checkbox']},
                        }));
                    });
                });
                </script>
            ");
        }
        break;
}
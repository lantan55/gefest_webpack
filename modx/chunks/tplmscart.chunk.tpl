
<div id="msCart" class="cart-table">
    {if !count($products)}
        <div class="alert alert-warning">
            {'ms2_cart_is_empty' | lexicon}
        </div>
    {else}
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col" class="title">{'ms2_cart_title' | lexicon}</th>
                    <th scope="col" class="count">{'ms2_cart_count' | lexicon}</th>
                    <th scope="col" class="price">{'ms2_cart_price' | lexicon}</th>
                    <th scope="col" class="remove"></th>
                </tr>
                </thead>
                <tbody class="">
                    {foreach $products as $product}
                        {var $image}
                        {if $product.thumb?}
                            <img src="{$product.thumb}" alt="{$product.pagetitle}" title="{$product.pagetitle}"/>
                        {else}
                            <img src="{'assets_url' | option}components/minishop2/img/web/ms2_small.png"
                                 srcset="{'assets_url' | option}components/minishop2/img/web/ms2_small@2x.png 2x"
                                 alt="{$product.pagetitle}" title="{$product.pagetitle}"/>
                        {/if}
                        {/var}
                        <tr id="{$product.key}" class="">
                            <td class="title cart-table__td">
                                <div class="d-flex align-items-center">
                                    <div class="image mw-100 pr-3">
                                        {if $product.id?}
                                            <a href="{$product.id | url}">{$image}</a>
                                        {else}
                                            {$image}
                                        {/if}
                                    </div>
                                    <div class="title ">
                                        {if $product.id?}
                                            <a href="{$product.id | url}">{$product.pagetitle}</a>
                                        {else}
                                            {$product.name}
                                        {/if}
                                        {if $product.options?}
                                            <div class="small">
                                                {$product.options | join : '; '}
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            </td>
                            <td class="count ">
                                {$product.count}
                            </td>
                            
                            <td class="price ">
                                <div class="d-flex align-items-center">
                                    <span class="mr-2 text-nowrap">{$product.price} {'ms2_frontend_currency' | lexicon}</span>
                                    {if $product.old_price?}
                                        <span class="old_price text-nowrap">{$product.old_price} {'ms2_frontend_currency' | lexicon}</span>
                                    {/if}
                                </div>
                            </td>
                            <td class="remove ">
                                <div class="d-flex align-items-center">
                                    <form method="post" class="ms2_form text-md-right">
                                        <input type="hidden" name="key" value="{$product.key}">
                                        <button class="btn btn-sm btn-danger" type="submit" name="ms2_action" value="cart/remove">&times;</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
                <tr class="footer">
                    <th class="total">{'ms2_cart_total' | lexicon}:</th>
                    <th class="total_count">
                        <span class="ms2_total_count">{$total.count}</span>
                        {'ms2_frontend_count_unit' | lexicon}
                    </th>
                    <th class="total_weight text-nowrap">
                        <span class="ms2_total_weight">{$total.weight}</span>
                        {'ms2_frontend_weight_unit' | lexicon}
                    </th>
                    <th class="total_cost text-nowrap" colspan="2">
                        <span class="ms2_total_cost">{$total.cost}</span>
                        {'ms2_frontend_currency' | lexicon}
                    </th>
                </tr>
            </table>
        </div>

        <form method="post">
            <button type="submit" name="ms2_action" value="cart/clean" class="btn btn-danger">
                {'ms2_cart_clean' | lexicon}
            </button>
        </form>
    {/if}
</div>

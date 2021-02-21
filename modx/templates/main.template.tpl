<!DOCTYPE html>
<html lang="ru">
  {include 'head'}
  <body>
    {include 'header'} 
    {block 'main'}{/block} 
    {include 'footer'}
    {include 'modals'} 
    {include 'scripts'}
    {ignore}
      [[++custom_script]]
    {/ignore}    
  </body>
</html>

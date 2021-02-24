import 'jquery.steps'
import 'jquery.steps/dist/jquery-steps.css'

$('#stepReq').steps({
  onFinish: function () { 
    $('#formReq').trigger('submit')
   }
});
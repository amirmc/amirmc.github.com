/* ===================================================
 * Go To Specific slide in carousel
 * ===================================================
 *
 * limitations under the License.
 * ========================================================== */

$(document).ready(function(){
  $('.gallery .thumbnails a').click(function(){
    var position = $(this).data('position') - 1;
    $(this).closest('.gallery').children('.carousel').carousel(position);
  });
});

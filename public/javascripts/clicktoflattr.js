(function($){
  $.fn.clickToFlattr = function() {
    this.click(function (e) {
      e.preventDefault();

      var tags_array = new Array();
      $(this).parent().parent().find('.tags a').each(function(){
        tag = $(this).text().trim();
        tags_array.push(tag.substr(1, tag.length));
      });
      var tags = tags_array.join(',');

      var description = $(this).parent().parent().parent().find(".blogboxIntro").html();
      var description = description.replace(/<\/?[^>]+>/gi, '').trim();
      if (description.length > 100) {
        description = description.substr(0, 97);
        description += "...";
      }

      var link = $('<a/>').addClass('FlattrButton').text(description)
        .attr('href', this.href)
        .attr('title', this.title)
        .attr('lang', 'en')
        .attr('data-flattr-uid', 'denschub')
        .attr('data-flattr-category', 'text')
        .attr('data-flattr-tags', tags)
        .css('display', 'none');

      $(this).parent().html(link);

      $.getScript('http://api.flattr.com/js/0.6/load.js?mode=auto&button=compact');
    });
  };
})(jQuery);



<div class="row medium-8 large-7 columns">

% for picture in pictures:

  <div class="blog-post">
    <h3>
      <% import os
         import datetime

      stat = datetime.datetime.fromtimestamp(
        int(os.stat(picture.name).st_mtime)
        ).strftime('%Y-%m-%d   %H:%M')
      %>
      {{stat}}
    </h3>
    <img class="thumbnail" src="/pictures/{{picture.name.split('/')[-1]}}">
  </div>

% end

</div>
</body>
</html>

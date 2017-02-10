
<div class="row medium-8 large-5 columns">

  <div class="blog-post">
    <h3><strong>What?</strong></h3>
    <p align="justify">Sophie's Secret Garden is a small python web server
       running on a raspberry pi in my kitchen. It is connected to a
       webcam and is scheduled to take a picture every 30 minutes of some
       herbs that we hope to grow! The last 10 pictures are shown on the
       home page.</p>
  </div>


  <div class="blog-post">
    <h3><strong>Why?</strong></h3>
    <p align="justify">Long term, the plan is to create a time lapse video of the herbs
    as they grow. The web site was just for a bit of fun.</p>
  </div>


  <div class="blog-post">
    <h3><strong>How?</strong></h3>
    <p align="justify">
      <div class="blog-post">
        <h4><strong>Setup</strong></h4>
        <p align="justify"><img src="static/setup.jpg"></p>
      </div>

      <div class="blog-post">
      <h4><strong>Take a picture</strong></h4>
      <p align="justify">
      <!-- HTML generated using hilite.me -->
      <div style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .1em;"><pre style="margin: 0; line-height: 125%"><span style="color: #75715e">#!/usr/bin/env python</span>

      <span style="color: #f92672">import</span> <span style="color: #f8f8f2"><a href="http://www.pygame.org/">pygame</a></span>
      <span style="color: #f92672">import</span> <span style="color: #f8f8f2">pygame.camera</span>
      <span style="color: #f92672">import</span> <span style="color: #f8f8f2">glob</span>

      <span style="color: #f8f8f2">file_path</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;/home/pi/sophies_garden/pictures/&quot;</span>

      <span style="color: #75715e">#Grab an image from the camera</span>
      <span style="color: #f8f8f2">pygame</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">camera</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">init()</span>
      <span style="color: #f8f8f2">cam</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">pygame</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">camera</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">Camera(</span><span style="color: #e6db74">&quot;/dev/video0&quot;</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">(</span><span style="color: #ae81ff">1280</span><span style="color: #f8f8f2">,</span> <span style="color: #ae81ff">720</span><span style="color: #f8f8f2">))</span>
      <span style="color: #f8f8f2">cam</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">start()</span>
      <span style="color: #f8f8f2">img</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">cam</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">get_image()</span>

      <span style="color: #75715e">#Sort the exisiting images</span>
      <span style="color: #f8f8f2">file_list</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">[_</span> <span style="color: #66d9ef">for</span> <span style="color: #f8f8f2">_</span> <span style="color: #f92672">in</span> <span style="color: #f8f8f2">glob</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">glob(</span><span style="color: #e6db74">&quot;{}*.jpg&quot;</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">format(file_path))]</span>
      <span style="color: #f8f8f2">file_list</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">sort()</span>

      <span style="color: #66d9ef">if</span> <span style="color: #f92672">not</span> <span style="color: #f8f8f2">file_list:</span>
          <span style="color: #75715e">#If there are no exisiting images, create the first</span>
          <span style="color: #f8f8f2">pygame</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">image</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">save(img,</span> <span style="color: #e6db74">&quot;{}000000.jpg&quot;</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">format(file_path))</span>
      <span style="color: #66d9ef">else</span><span style="color: #f8f8f2">:</span>
          <span style="color: #75715e">#If the are some images, grab the number of the last one, and save the</span>
          <span style="color: #75715e"># next in the sequence</span>
          <span style="color: #f8f8f2">last_file</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">int(file_list[</span><span style="color: #f92672">-</span><span style="color: #ae81ff">1</span><span style="color: #f8f8f2">]</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">split(</span><span style="color: #e6db74">&quot;/&quot;</span><span style="color: #f8f8f2">)[</span><span style="color: #f92672">-</span><span style="color: #ae81ff">1</span><span style="color: #f8f8f2">][:</span><span style="color: #f92672">-</span><span style="color: #ae81ff">4</span><span style="color: #f8f8f2">])</span>
          <span style="color: #f8f8f2">pygame</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">image</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">save(img,</span> <span style="color: #e6db74">&quot;{}{:06d}.jpg&quot;</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">format(file_path,</span> <span style="color: #f8f8f2">last_file</span> <span style="color: #f92672">+</span> <span style="color: #ae81ff">1</span><span style="color: #f8f8f2">))</span>
      </pre></div>
      </p>
      </div>

  <div class="blog-post">
  <h4><strong>Web Server Code</strong></h4>
  <p align="justify">
  <!-- HTML generated using hilite.me -->
  <div style="background: #272822; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .1em;"><pre style="margin: 0; line-height: 125%"><span style="color: #75715e">#!/usr/bin/env python</span>

  <span style="color: #f92672">from</span> <span style="color: #f8f8f2"><a href="http://bottlepy.org/" target="_blank">bottle</a></span> <span style="color: #f92672">import</span> <span style="color: #f8f8f2">route,</span> <span style="color: #f8f8f2">run,</span> <span style="color: #f8f8f2">template,</span> <span style="color: #f8f8f2">error,</span> <span style="color: #f8f8f2">static_file</span>
  <span style="color: #f92672">import</span> <span style="color: #f8f8f2">glob</span>
  <span style="color: #f92672">import</span> <span style="color: #f8f8f2">os</span>

  <span style="color: #f8f8f2">TITLE</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;Sophie&#39;s Secret Garden&quot;</span>
  <span style="color: #f8f8f2">CAPTION</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;How does your garden grow?&quot;</span>
  <span style="color: #f8f8f2">file_path</span> <span style="color: #f92672">=</span> <span style="color: #e6db74">&quot;/home/pi/sophies_garden/pictures/&quot;</span>


  <span style="color: #a6e22e">@route</span><span style="color: #f8f8f2">(</span><span style="color: #e6db74">&#39;/static/&lt;filename&gt;&#39;</span><span style="color: #f8f8f2">)</span>
  <span style="color: #66d9ef">def</span> <span style="color: #a6e22e">server_static</span><span style="color: #f8f8f2">(filename):</span>
      <span style="color: #75715e">#Serve static webfiles (css, favicon, etc)</span>
      <span style="color: #66d9ef">return</span> <span style="color: #f8f8f2">static_file(filename,</span> <span style="color: #f8f8f2">root</span><span style="color: #f92672">=</span><span style="color: #e6db74">&#39;/home/pi/sophies_garden/static&#39;</span><span style="color: #f8f8f2">)</span>

  <span style="color: #a6e22e">@route</span><span style="color: #f8f8f2">(</span><span style="color: #e6db74">&#39;/pictures/&lt;filename&gt;&#39;</span><span style="color: #f8f8f2">)</span>
  <span style="color: #66d9ef">def</span> <span style="color: #a6e22e">picture_statics</span><span style="color: #f8f8f2">(filename):</span>
      <span style="color: #75715e">#Serve the pictures from the webcam</span>
      <span style="color: #66d9ef">return</span> <span style="color: #f8f8f2">static_file(filename,</span> <span style="color: #f8f8f2">root</span><span style="color: #f92672">=</span><span style="color: #e6db74">&#39;/home/pi/sophies_garden/pictures&#39;</span><span style="color: #f8f8f2">)</span>


  <span style="color: #66d9ef">def</span> <span style="color: #a6e22e">getint</span><span style="color: #f8f8f2">(file_obj):</span>
      <span style="color: #75715e">#Function to sort the file objects in reverse order</span>
      <span style="color: #f8f8f2">basename</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">file_obj</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">name</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">split(</span><span style="color: #e6db74">&#39;/&#39;</span><span style="color: #f8f8f2">)[</span><span style="color: #f92672">-</span><span style="color: #ae81ff">1</span><span style="color: #f8f8f2">][:</span><span style="color: #f92672">-</span><span style="color: #ae81ff">4</span><span style="color: #f8f8f2">]</span>
      <span style="color: #66d9ef">return</span> <span style="color: #f92672">-</span><span style="color: #f8f8f2">int(basename)</span>


  <span style="color: #a6e22e">@route</span><span style="color: #f8f8f2">(</span><span style="color: #e6db74">&#39;/&#39;</span><span style="color: #f8f8f2">)</span>
  <span style="color: #66d9ef">def</span> <span style="color: #a6e22e">index</span><span style="color: #f8f8f2">():</span>
      <span style="color: #75715e">#Grab all the files so we can sort them</span>
      <span style="color: #f8f8f2">pic_files</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">pictures</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">[open(_)</span> <span style="color: #66d9ef">for</span> <span style="color: #f8f8f2">_</span> <span style="color: #f92672">in</span> <span style="color: #f8f8f2">glob</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">glob(</span><span style="color: #e6db74">&quot;{}*.jpg&quot;</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">format(file_path))]</span>
      <span style="color: #f8f8f2">pic_files</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">sort(key</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">getint)</span>

      <span style="color: #75715e">#Return the html from template. Pass in the last 10 images</span>
      <span style="color: #66d9ef">return</span> <span style="color: #f8f8f2">(</span>
          <span style="color: #f8f8f2">template(</span><span style="color: #e6db74">&#39;header&#39;</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">title</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">TITLE,</span> <span style="color: #f8f8f2">caption</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">CAPTION)</span> <span style="color: #f92672">+</span>
          <span style="color: #f8f8f2">template(</span><span style="color: #e6db74">&#39;index&#39;</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">title</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">TITLE,</span> <span style="color: #f8f8f2">caption</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">CAPTION,</span> <span style="color: #f8f8f2">pictures</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">pic_files[:</span><span style="color: #ae81ff">10</span><span style="color: #f8f8f2">])</span>
          <span style="color: #f8f8f2">)</span>


  <span style="color: #a6e22e">@route</span><span style="color: #f8f8f2">(</span><span style="color: #e6db74">&#39;/what-it-is&#39;</span><span style="color: #f8f8f2">)</span>
  <span style="color: #66d9ef">def</span> <span style="color: #a6e22e">what</span><span style="color: #f8f8f2">():</span>
      <span style="color: #75715e">#Return the html from template</span>
      <span style="color: #66d9ef">return</span> <span style="color: #f8f8f2">(</span>
          <span style="color: #f8f8f2">template(</span><span style="color: #e6db74">&#39;header&#39;</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">title</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">TITLE,</span> <span style="color: #f8f8f2">caption</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">CAPTION)</span> <span style="color: #f92672">+</span>
          <span style="color: #f8f8f2">template(</span><span style="color: #e6db74">&#39;what&#39;</span><span style="color: #f8f8f2">)</span>
          <span style="color: #f8f8f2">)</span>


  <span style="color: #a6e22e">@error</span><span style="color: #f8f8f2">(</span><span style="color: #ae81ff">404</span><span style="color: #f8f8f2">)</span>
  <span style="color: #a6e22e">@error</span><span style="color: #f8f8f2">(</span><span style="color: #ae81ff">500</span><span style="color: #f8f8f2">)</span>
  <span style="color: #66d9ef">def</span> <span style="color: #a6e22e">error</span><span style="color: #f8f8f2">(error):</span>
      <span style="color: #75715e">#Return the html from template</span>
      <span style="color: #66d9ef">return</span> <span style="color: #f8f8f2">(</span>
          <span style="color: #f8f8f2">template(</span><span style="color: #e6db74">&#39;header&#39;</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">title</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">TITLE,</span> <span style="color: #f8f8f2">caption</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">CAPTION)</span> <span style="color: #f92672">+</span>
          <span style="color: #f8f8f2">template(</span><span style="color: #e6db74">&#39;error&#39;</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">code</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">error</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">status_code)</span>
          <span style="color: #f8f8f2">)</span>

  <span style="color: #75715e">#Start the webserver</span>
  <span style="color: #f8f8f2">run(host</span><span style="color: #f92672">=</span><span style="color: #e6db74">&#39;0.0.0.0&#39;</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">port</span><span style="color: #f92672">=</span><span style="color: #ae81ff">80</span><span style="color: #f8f8f2">,</span> <span style="color: #f8f8f2">debug</span><span style="color: #f92672">=</span><span style="color: #f8f8f2">True)</span>
  </pre></div>
</p>
</div>

</div>
</body>
</html>

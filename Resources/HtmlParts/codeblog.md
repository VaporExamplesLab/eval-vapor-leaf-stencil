<!-- :CONTENT:BEGIN:Blog: -->  
# Code Blog

Here's a Swift snippet which illustrates 
selective platform compilation.

``` swift
#if os(Linux)
  //
#elseif os(macOS)
  //  
#else
  // 
#endif
```

<!-- :CONTENT:MORE:Blog: -->

``` html
<p>Here's a Swift snippet which illustrates 
selective platform compilation.</p>

<pre><code class="swift">
#if os(Linux)
  //
#elseif os(macOS)
  //  
#else
  // 
#endif
</code></pre>
```

**Arduino C/C++**

Hey robotics club members, the [Arduino forum](https://forum.arduino.cc/index.php?topic=98155.0) had the answer we were looking for! 

``` cpp
#if !(defined(ARDUINO) && ARDUINO >= 100)
  #include <EthernetDNS.h>   
#endif
```

``` html
<p>Hey robotics club members, the
<a href="https://forum.arduino.cc/index.php?topic=98155.0">Arduino forum</a>
    had the answer we were looking for!</p>

<pre><code class="cpp">
#if !(defined(ARDUINO) && ARDUINO >= 100)
  #include <EthernetDNS.h>   
#endif
</code></pre>
```

**HTML Templating**


``` html
<p>Use the following pattern to 
write about <code>#Syntax(…)#</code>
in fenced code markdown syntax:</p>

<pre><code class="syntax">
… #Syntax(…)# example
… #tag# ... #endtag#
… #if()# ... #endif# 
</code></pre>
```

**HTML CSS**

`#` is an CSS id selector. Here are some examples:

``` css
#navigation { width: 12em; color: #333; }
div#navigation { width: 12em; color: #333; } 
```



<!-- :CONTENT:END:Blog: -->
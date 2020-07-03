
# Table of Contents

1.  [Section Heading](#org6d1c5bf)
    1.  [Subsection heading](#orga877ddb)
    2.  [Another subsection heading](#orgadfb511)
    3.  [Quote and examples](#orga545848)
    4.  [Export to md](#org50fab28)



<a id="org6d1c5bf"></a>

# Section Heading


<a id="orga877ddb"></a>

## Subsection heading


<a id="orgadfb511"></a>

## Another subsection heading

Some description 

-   item 1
-   item 2
-   item 3
    
    **bold** *italic* <span class="underline">underlined</span> <del>strike-through</del> Greek letter &Gamma;

Some enumerated  items 

1.  First
2.  Second
3.  Third


<a id="orga545848"></a>

## Quote and examples

> Everything should be made as simple as possible but not simpler &#x2013; Albert Einstein

    Here is an example
    : Some example from a text file. 


<a id="org50fab28"></a>

## Export to md

The default *org-mode* does not have the option to export .org file to *markdown* (.md file).   For that you will need to replace the **org** layer in *dotspacemacs* file   with the   following 

    (org :variables
         org-enable-github-support t)

<img src="ltximg/myFirstOrgFile_351b79e5c3a74774046066e241ffb693505c88a3.png" alt="myFirstOrgFile_351b79e5c3a74774046066e241ffb693505c88a3.png" />

**Note: In case C-c C-e command doesn't show the export option for m (markdown), then simply open dotspacemacs file and complile it with M-SPC f e R.** After that, you should see the option to export to markdown! 


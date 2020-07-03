
# Table of Contents

1.  [Section Heading](#org9aaa8de)
    1.  [Subsection heading](#org108d1cc)
    2.  [Another subsection heading](#orgdfb54c5)
    3.  [Quote and examples](#orgc60c1de)
    4.  [Export to md](#orgde71530)



<a id="org9aaa8de"></a>

# Section Heading


<a id="org108d1cc"></a>

## Subsection heading


<a id="orgdfb54c5"></a>

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


<a id="orgc60c1de"></a>

## Quote and examples

> Everything should be made as simple as possible but not simpler &#x2013; Albert Einstein

    Here is an example
    : Some example from a text file. 


<a id="orgde71530"></a>

## Export to md

The default *org-mode* does not have the option to export .org file to *markdown* (.md file).   For that you will need to replace the **org** layer in *dotspacemacs* file   with the   following 


<div class="equation-container">
<span class="equation">
<img src="ltximg/myFirstOrgFile_b783048a3b91ae9f48488f05806bdeebbbd91efb.png" alt="myFirstOrgFile_b783048a3b91ae9f48488f05806bdeebbbd91efb.png" />
</span>
<span class="equation-label">
1
</span>
</div>

Latex Equation can be exported to *markdown*


<div class="equation-container">
<span class="equation">
<img src="ltximg/myFirstOrgFile_cdd40f6f32ace008e93e75c47b5dd0f563e1a9f1.png" alt="myFirstOrgFile_cdd40f6f32ace008e93e75c47b5dd0f563e1a9f1.png" />
</span>
<span class="equation-label">
1
</span>
</div>

**Note: In case C-c C-e command doesn't show the export option for m (markdown), then simply open dotspacemacs file and complile it with M-SPC f e R.** After that, you should see the option to export to markdown! 


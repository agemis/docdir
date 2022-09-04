#---------------------------------------------------------[Initialisations]--------------------------------------------------------
# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


#---------------------------------------------------------[Form]--------------------------------------------------------

[System.Windows.Forms.Application]::EnableVisualStyles()


# https://www.rlvision.com/blog/a-drag-and-drop-gui-made-with-powershell/

$TOP = 20
$LEFT = 20
$DELTA_WIDTH = 100
$DELTA_HEIGHT = 30

# Form
$form                    = New-Object system.Windows.Forms.Form
$form.ClientSize         = '1080,400'
$form.text               = "Documentation directory name"
$form.BackColor          = "#ffffff"
$form.TopMost            = $false
$form.StartPosition = "CenterScreen"
$form.MaximizeBox = $False
$form.Topmost = $True
$form.AllowDrop = $true

# Controls
$AuthorLabel = New-Object system.Windows.Forms.Label
$AuthorLabel.text = "Author"
$AuthorLabel.AutoSize = $true
$AuthorLabel.width = 25
$AuthorLabel.Font = 'Microsoft Sans Serif,10'
$AuthorLabel.location  = New-Object System.Drawing.Point($LEFT,$TOP)

$AuthorName = New-Object system.Windows.Forms.TextBox
$AuthorName.multiline = $false
$AuthorName.width= 400
$AuthorName.Font= 'Microsoft Sans Serif,10'
$AuthorName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),$TOP)
$AuthorName.Visible = $true

$ProdYearLabel = New-Object system.Windows.Forms.Label
$ProdYearLabel.text = "ProdYear"
$ProdYearLabel.AutoSize = $true
$ProdYearLabel.width = 25
$ProdYearLabel.Font = 'Microsoft Sans Serif,10'
$ProdYearLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + $DELTA_HEIGHT))

$ProdYearName = New-Object system.Windows.Forms.TextBox
$ProdYearName.multiline = $false
$ProdYearName.width = 100
$ProdYearName.Font = 'Microsoft Sans Serif,10'
$ProdYearName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + $DELTA_HEIGHT))
$ProdYearName.Visible = $true

$PathLabel = New-Object system.Windows.Forms.Label
$PathLabel.text = "Path"
$PathLabel.AutoSize = $true
$PathLabel.width = 25
$PathLabel.Font = 'Microsoft Sans Serif,10'
$PathLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 2 * $DELTA_HEIGHT))

$PathName = New-Object system.Windows.Forms.TextBox
$PathName.multiline = $false
$PathName.width = 400
$PathName.Font = 'Microsoft Sans Serif,10'
$PathName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 2 * $DELTA_HEIGHT))
$PathName.Visible = $true

$CategoryLabel = New-Object system.Windows.Forms.Label
$CategoryLabel.text = "Category"
$CategoryLabel.AutoSize = $true
$CategoryLabel.width = 25
$CategoryLabel.Font = 'Microsoft Sans Serif,10'
$CategoryLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 3 * $DELTA_HEIGHT))

$CategoryName = New-Object system.Windows.Forms.TextBox
$CategoryName.multiline = $false
$CategoryName.width = 400
$CategoryName.Font = 'Microsoft Sans Serif,10'
$CategoryName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 3 * $DELTA_HEIGHT))
$CategoryName.Visible = $true

$TitleLabel = New-Object system.Windows.Forms.Label
$TitleLabel.text = "Title"
$TitleLabel.AutoSize = $true
$TitleLabel.width = 25
$TitleLabel.Font = 'Microsoft Sans Serif,10'
$TitleLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 4 * $DELTA_HEIGHT))

$TitleName = New-Object system.Windows.Forms.TextBox
$TitleName.multiline = $false
$TitleName.width = 400
$TitleName.Font = 'Microsoft Sans Serif,10'
$TitleName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 4 * $DELTA_HEIGHT))
$TitleName.Visible = $true

$RatingLabel = New-Object system.Windows.Forms.Label
$RatingLabel.text = "Rating"
$RatingLabel.AutoSize = $true
$RatingLabel.width = 25
$RatingLabel.Font = 'Microsoft Sans Serif,10'
$RatingLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 5 * $DELTA_HEIGHT))

$RatingName = New-Object system.Windows.Forms.TextBox
$RatingName.multiline = $false
$RatingName.width = 400
$RatingName.Font = 'Microsoft Sans Serif,10'
$RatingName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 5 * $DELTA_HEIGHT))
$RatingName.Visible = $true

$TagLabel = New-Object system.Windows.Forms.Label
$TagLabel.text = "Tag"
$TagLabel.AutoSize = $true
$TagLabel.width = 25
$TagLabel.Font = 'Microsoft Sans Serif,10'
$TagLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 6 * $DELTA_HEIGHT))

$TagName = New-Object system.Windows.Forms.TextBox
$TagName.multiline = $false
$TagName.width = 400
$TagName.Font = 'Microsoft Sans Serif,10'
$TagName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 6 * $DELTA_HEIGHT))
$TagName.Visible = $true

$MetaTagLabel = New-Object system.Windows.Forms.Label
$MetaTagLabel.text = "MetaTag"
$MetaTagLabel.AutoSize = $true
$MetaTagLabel.width = 25
$MetaTagLabel.Font = 'Microsoft Sans Serif,10'
$MetaTagLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 7 * $DELTA_HEIGHT))

$MetaTagName = New-Object system.Windows.Forms.TextBox
$MetaTagName.multiline = $false
$MetaTagName.width = 400
$MetaTagName.Font = 'Microsoft Sans Serif,10'
$MetaTagName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 7 * $DELTA_HEIGHT))
$MetaTagName.Visible = $true

$StoreYearLabel = New-Object system.Windows.Forms.Label
$StoreYearLabel.text = "StoreYear"
$StoreYearLabel.AutoSize = $true
$StoreYearLabel.width = 25
$StoreYearLabel.Font = 'Microsoft Sans Serif,10'
$StoreYearLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 8 * $DELTA_HEIGHT))

$StoreYearName = New-Object system.Windows.Forms.TextBox
$StoreYearName.multiline = $false
$StoreYearName.width = 400
$StoreYearName.Font = 'Microsoft Sans Serif,10'
$StoreYearName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 8 * $DELTA_HEIGHT))
$StoreYearName.Visible = $true


$IDLabel = New-Object system.Windows.Forms.Label
$IDLabel.text = "ID"
$IDLabel.AutoSize = $true
$IDLabel.width = 25
$IDLabel.Font = 'Microsoft Sans Serif,10'
$IDLabel.location = New-Object System.Drawing.Point($LEFT, ($TOP + 9 * $DELTA_HEIGHT))

$IDName = New-Object system.Windows.Forms.TextBox
$IDName.multiline = $false
$IDName.width = 400
$IDName.Font = 'Microsoft Sans Serif,10'
$IDName.location = New-Object System.Drawing.Point(($LEFT + $DELTA_WIDTH),($TOP + 9 * $DELTA_HEIGHT))
$IDName.Visible = $true
$IDName.Enabled = $false

$DirectoryNameName = New-Object system.Windows.Forms.TextBox
$DirectoryNameName.multiline = $false
$DirectoryNameName.width = 1000
$DirectoryNameName.text = "N/A"
$DirectoryNameName.Font = 'Microsoft Sans Serif,10'
$DirectoryNameName.location = New-Object System.Drawing.Point($LEFT, ($TOP + 10 * $DELTA_HEIGHT))
$DirectoryNameName.Visible = $true
$DirectoryNameName.ReadOnly = $true




$OKBtn                   = New-Object system.Windows.Forms.Button
$OKBtn.BackColor         = "#ff7b00"
$OKBtn.text              = "OK"
$OKBtn.width             = 90
$OKBtn.height            = 30
$OKBtn.location = New-Object System.Drawing.Point(($LEFT + 200),($TOP + 11 * $DELTA_HEIGHT))
$OKBtn.Font              = 'Microsoft Sans Serif,10'
$OKBtn.ForeColor         = "#ffffff"
$OKBtn.Visible           = $true

$cancelBtn                       = New-Object system.Windows.Forms.Button
$cancelBtn.BackColor             = "#ffffff"
$cancelBtn.text                  = "Cancel"
$cancelBtn.width                 = 90
$cancelBtn.height                = 30
$cancelBtn.location = New-Object System.Drawing.Point(($LEFT + 200 + $DELTA_WIDTH),($TOP + 11 * $DELTA_HEIGHT))
$cancelBtn.Font                  = 'Microsoft Sans Serif,10'
$cancelBtn.ForeColor             = "#000"
$cancelBtn.DialogResult          = [System.Windows.Forms.DialogResult]::Cancel

$ComputeBtn                   = New-Object system.Windows.Forms.Button
$ComputeBtn.BackColor             = "#ffffff"
$ComputeBtn.text              = "Compute"
$ComputeBtn.width             = 90
$ComputeBtn.height            = 30
$ComputeBtn.location = New-Object System.Drawing.Point(($LEFT + 200 + 2 * $DELTA_WIDTH),($TOP + 11 * $DELTA_HEIGHT))
$ComputeBtn.Font              = 'Microsoft Sans Serif,10'
$ComputeBtn.ForeColor             = "#000"
$ComputeBtn.Visible           = $true




$form.CancelButton   = $cancelBtn
$form.Controls.Add($cancelBtn)

# Add Controls to Form
$form.SuspendLayout()
$form.controls.AddRange(@($AuthorLabel,$AuthorName,$ProdYearLabel,$ProdYearName,$PathLabel,$PathName,$CategoryLabel,$CategoryName,$TitleLabel,$TitleName,$RatingLabel,$RatingName,$TagLabel,$TagName,$MetaTagLabel,$MetaTagName, `
                                    $StoreYearLabel,$StoreYearName,$IDLabel,$IDName,$DirectoryNameName, `
                                    $OKBtn,$cancelBtn,$ComputeBtn))
$form.ResumeLayout()


# Event handlers

$form_DragOver = [System.Windows.Forms.DragEventHandler]{
    if ($_.Data.GetDataPresent([Windows.Forms.DataFormats]::FileDrop)) # $_ = [System.Windows.Forms.DragEventArgs]
	{
	    $_.Effect = 'Copy'
	}
	else
	{
	    $_.Effect = 'None'
	}
}
	
$form_DragDrop = [System.Windows.Forms.DragEventHandler]{
    $a = $_.Data.GetData([Windows.Forms.DataFormats]::FileDrop) # $_ = [System.Windows.Forms.DragEventArgs]
    if ($a.Count -eq 1)
    {
        if (Test-Path -Path $a[0] -PathType Container)
        {
            $dir =  Split-Path $a[0] -leaf
            
             
            $x = [DocDirectory]::new($dir)

            $AuthorName.Text = $x.Author
            $ProdYearName.Text = $x.Prodyear
            $PathName.Text = $x.Path
            $CategoryName.Text =  $x.Category
            $TitleName.Text = $x.Title
            $RatingName.Text = $x.Rating
            $TagName.Text = $x.Tag
            $MetaTagName.Text = $x.MetaTag
            $StoreYearName.Text = $x.StoreYear
            $IDName.Text = $x.ID
            
        }
    }


}

$form_FormClosed = {
	try
    {
        #$listBox.remove_Click($button_Click)
		$form.remove_DragOver($form_DragOver)
		$form.remove_DragDrop($form_DragDrop)
		$form.remove_FormClosed($Form_Cleanup_FormClosed)
	}
	catch [Exception]
    { }
}




function ComputeBtn_Clicked { 
    $doc = [DocDirectory]::new($AuthorName.Text, $ProdYearName.Text, $PathName.Text, $CategoryName.Text, $TitleName.Text, $RatingName.Text, $TagName.Text, $MetaTagName.Text, $StoreYearName.Text, $IDName.Text)
    Write-Host $doc
    $DirectoryNameName.text = $doc.DirectoryName()
}



# Wire events
#$button.Add_Click($button_Click)
$form.Add_DragOver($form_DragOver)
$form.Add_DragDrop($form_DragDrop)
$form.Add_FormClosed($form_FormClosed)


$ComputeBtn.Add_Click({ ComputeBtn_Clicked })


#-----------------------------------------------------------[Functions]------------------------------------------------------------







[void] $form.ShowDialog()



# classe a externaliser

class DocDirectory
{
    [string] $Author
    [string] $Prodyear
    [string] $Path
    [string] $Category
    [string] $Title
    [string] $Rating
    [string] $Tag
    [string] $Metatag
    [string] $StoreYear
    [string] $ID
     
    DocDirectory([string] $DirectoryName) 
    {
        $parts = $DirectoryName.Split("_")
        if ($parts)
        {
            if ($parts.Count -eq 10)
            {
                $this.Author = $($parts[0])
                $this.Prodyear = $($parts[1])
                $this.Path = $($parts[2])
                $this.Category = $($parts[3])
                $this.Title = $($parts[4])
                $this.Rating = $($parts[5])
                $this.Tag = $($parts[6])
                $this.Metatag = $($parts[7])
                $this.StoreYear = $($parts[8])
                $this.ID = $($parts[9])
            }
            else 
            {
                Write-Error "Bad format - parts count = $($parts.Count), expected = 10"
                Write-Error "    $DirectoryName"
            }
            
        }
    }

    DocDirectory([string] $Author, [string] $ProdYear, [string] $Path, [string] $Category, [string] $Title, [string] $Rating, [string] $Tag, [string] $Metatag, [string] $StoreYear, [string] $ID) 
    {
       $this.Author = $Author
       $this.Prodyear = $ProdYear
       $this.Path = $Path
       $this.Category = $Category
       $this.Title = $Title
       $this.Rating = $Rating
       $this.Tag = $Tag
       $this.Metatag = $Metatag
       $this.StoreYear = $StoreYear
       $this.ID = $ID
       
    }    


    [string] DirectoryName() {
        return "$($this.Author)_$($this.Prodyear)_$($this.Path)_$($this.Category)_$($this.Title)_$($this.Rating)_$($this.Tag)_$($this.Metatag)_$($this.StoreYear)_$($this.ID)"
    }


}

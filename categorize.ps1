
# 0eme fonction: verifier les rÃ©pertoires, indiquer ceux qui ne sont pas corrects, ajouter un guid qui servira de clef primaire
# 1ere fonction: remplir/synchroniser une bdd avec les noms des rÃ©pertoires
# 2eme fonction: recherche d'info dans la bdd
# 3eme fonction: modif de la bdd, eventuellement en masse
# 4eme fonction: synchro bdd -> repertoire 




# Ancienne convention, pour rattrapage
# aaron-bertrand_2020_book_kind-logiciel-kind-sqlserver-year-2020_sql-server-2019-new-functionnalities
class OldDocDirectory
{
    [string] $Author
    [string] $Prodyear
    [string] $Category    
    [string] $Tags
    [string]  $Title
    
    [string] $StoreYear
     
    OldDocDirectory([string] $DirectoryName) 
    {
        $parts = $DirectoryName.Split("_")
        if ($parts)
        {
            if ($parts.Count -eq 5)
            {
                $this.Author = $($parts[0])
                $this.Prodyear = $($parts[1])
                $this.Category = $($parts[2])
                $this.Tags = $($parts[3])
                $this.Title = $($parts[4])
                $atags = ($this.Tags).Split("-")
                if ($atags)
                {

                    For ($i=0; $i -lt $atags.Length; $i++) 
                    {
                        if ($atags[$i] -eq "year")
                        {
                            $this.StoreYear = $atags[$i+1]
                            break
                        }
                        
                    }


                }    
                


            }
            
        }
    }

    OldDocDirectory([string] $Author, [string] $Prodyear, [string] $Category, [string] $Tags, [string] $Title) 
    {
       $this.Author = $Author
       $this.Prodyear = $Prodyear
       $this.Category = $Category
       $this.Tags = $Tags
       $this.Title = $Title       
    }    


    [string] DirectoryName() {
        return "$($this.Author)_$($this.Prodyear)_$($this.Category)_$($this.Tags)_$($this.Title)"
    }


}




# Nouvelle convention
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

    DocDirectory([string] $Author, [string] $Prodyear, [string] $Path, [string] $Category, [string] $Title, [string] $Rating, [string] $Tag, [string] $Metatag, [string] $StoreYear, [string] $ID) 
    {
       $this.Author = $Author
       $this.Prodyear = $Prodyear
       $this.Path = $Path
       $this.Category = $Category
       $this.Title = $Title
       $this.Note = $Rating
       $this.Tag = $Tag
       $this.Metatag = $Metatag
       $this.StoreYear = $StoreYear
       $this.ID = $ID
       
    }    


    [string] DirectoryName() {
        return "$($this.Author)_$($this.Prodyear)_$($this.Path)_$($this.Category)_$($this.Title)_$($this.Rating)_$($this.Tag)_$($this.Metatag)_$($this.StoreYear)_$($this.ID)"
    }


}



# test
# $x = [DocDirectory]::new("gail-show_2018_logiciel-sqlserver_videocourse_sql-server-distributed-replay_3___2022_04016776-3723-4402-a2bf-9dd3d00893d2")
#$x = [DocDirectory]::new("gail-show_logiciel-sqlserver_videocourse_sql-server-distributed-replay_3___2022_04016776-3723-4402-a2bf-9dd3d00893d2")
#if ($x.ID)
#{
  #$x.DirectoryName()
#}



# For each directory
Get-ChildItem "s:\documentation\2021\logiciel" -Recurse | Where-Object {$_.PsIsContainer} |
ForEach-Object {
   $curdir = $_
   #echo $curdir
   #echo "$($curdir.FullName)"

   
   $DIR = "S:\documentation\2021\logiciel\postgresql\"
   
   
   if ($curdir.FullName.StartsWith($DIR))
   {
      # ne prend que les rÃ©peroires de premier niveau
      $a=$curdir.FullName.Replace($DIR, "")
      if (-Not $a.Contains("\"))
      {
          #echo "$($curdir.FullName)"
          #echo "$($curdir.Name)"
          $y = [OldDocDirectory]::new($($curdir.Name))
          
          if ($y.Prodyear)
          {
            $newid = New-Guid
            $nd = [DocDirectory]::new($y.Author, $y.Prodyear, "", $y.Category, $y.Title, "", "", "", $y.StoreYear, $newid)

            echo "ancien : $($curdir.Name)"
            $nname = $nd.DirectoryName()

            $nd1 = [DocDirectory]::new($nname)
            $nname1 = $nd1.DirectoryName()

            echo "nouveau: $($nname1)"  
            $nd1

        
            Rename-Item -Path $($curdir.FullName) -NewName $($nname1)

          }

      
      }

   }

}



$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$Button1 = $null
[System.Windows.Forms.Button]$Button2 = $null
[System.Windows.Forms.TextBox]$TextBox1 = $null
[System.Windows.Forms.Button]$Button3 = $null
[System.Windows.Forms.Button]$Button4 = $null
[System.Windows.Forms.Button]$Button5 = $null
[System.Windows.Forms.Button]$Button6 = $null
[System.Windows.Forms.Button]$Button7 = $null
[System.Windows.Forms.Button]$Button8 = $null
[System.Windows.Forms.Button]$Button9 = $null
[System.Windows.Forms.Button]$Button10 = $null
[System.Windows.Forms.TextBox]$TextBox2 = $null
[System.Windows.Forms.Button]$Button11 = $null
[System.Windows.Forms.Button]$Button12 = $null
[System.Windows.Forms.Button]$Button13 = $null
[System.Windows.Forms.TextBox]$TextBox3 = $null
[System.Windows.Forms.Button]$Button14 = $null
[System.Windows.Forms.PictureBox]$PictureBox1 = $null
[System.Windows.Forms.TextBox]$TextBox4 = $null
[System.Windows.Forms.PictureBox]$PictureBox2 = $null
[System.Windows.Forms.Button]$Button15 = $null
[System.Windows.Forms.Button]$Button16 = $null
[System.Windows.Forms.Button]$Button17 = $null
[System.Windows.Forms.Button]$Button18 = $null
[System.Windows.Forms.Button]$Button19 = $null
[System.Windows.Forms.TextBox]$TextBox5 = $null
[System.Windows.Forms.Button]$Button20 = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot '2.resources.ps1')
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$Button2 = (New-Object -TypeName System.Windows.Forms.Button)
$TextBox1 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Button3 = (New-Object -TypeName System.Windows.Forms.Button)
$Button4 = (New-Object -TypeName System.Windows.Forms.Button)
$Button5 = (New-Object -TypeName System.Windows.Forms.Button)
$Button6 = (New-Object -TypeName System.Windows.Forms.Button)
$Button7 = (New-Object -TypeName System.Windows.Forms.Button)
$Button8 = (New-Object -TypeName System.Windows.Forms.Button)
$Button9 = (New-Object -TypeName System.Windows.Forms.Button)
$Button10 = (New-Object -TypeName System.Windows.Forms.Button)
$TextBox2 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Button11 = (New-Object -TypeName System.Windows.Forms.Button)
$Button12 = (New-Object -TypeName System.Windows.Forms.Button)
$Button13 = (New-Object -TypeName System.Windows.Forms.Button)
$TextBox3 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Button14 = (New-Object -TypeName System.Windows.Forms.Button)
$PictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$TextBox4 = (New-Object -TypeName System.Windows.Forms.TextBox)
$PictureBox2 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$Button15 = (New-Object -TypeName System.Windows.Forms.Button)
$Button16 = (New-Object -TypeName System.Windows.Forms.Button)
$Button17 = (New-Object -TypeName System.Windows.Forms.Button)
$Button18 = (New-Object -TypeName System.Windows.Forms.Button)
$Button19 = (New-Object -TypeName System.Windows.Forms.Button)
$TextBox5 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Button20 = (New-Object -TypeName System.Windows.Forms.Button)
([System.ComponentModel.ISupportInitialize]$PictureBox1).BeginInit()
([System.ComponentModel.ISupportInitialize]$PictureBox2).BeginInit()
$Form1.SuspendLayout()
#
#Button1
#
$Button1.BackColor = [System.Drawing.Color]::White
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]325))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]110,[System.Int32]23))
$Button1.TabIndex = [System.Int32]0
$Button1.Text = [System.String]'Enable firewall'
$Button1.UseVisualStyleBackColor = $false
$Button1.add_Click($Button1_Click)
#
#Button2
#
$Button2.BackColor = [System.Drawing.Color]::White
$Button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]354))
$Button2.Name = [System.String]'Button2'
$Button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]181,[System.Int32]26))
$Button2.TabIndex = [System.Int32]1
$Button2.Text = [System.String]'Disable guest user'
$Button2.UseVisualStyleBackColor = $false
$Button2.add_Click($Button2_Click)
#
#TextBox1
#
$TextBox1.BackColor = [System.Drawing.SystemColors]::GrayText
$TextBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]11))
$TextBox1.Name = [System.String]'TextBox1'
$TextBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150,[System.Int32]24))
$TextBox1.TabIndex = [System.Int32]2
$TextBox1.Text = [System.String]'Control panel interfaces'
$TextBox1.add_TextChanged($TextBox1_TextChanged)
#
#Button3
#
$Button3.BackColor = [System.Drawing.Color]::White
$Button3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]386))
$Button3.Name = [System.String]'Button3'
$Button3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]181,[System.Int32]26))
$Button3.TabIndex = [System.Int32]3
$Button3.Text = [System.String]'Disable Remote services'
$Button3.UseVisualStyleBackColor = $false
$Button3.add_Click($Button3_Click)
#
#Button4
#
$Button4.BackColor = [System.Drawing.Color]::White
$Button4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]293))
$Button4.Name = [System.String]'Button4'
$Button4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]26))
$Button4.TabIndex = [System.Int32]4
$Button4.Text = [System.String]'Enable Auto-Update'
$Button4.UseVisualStyleBackColor = $false
$Button4.add_Click($Button4_Click)
#
#Button5
#
$Button5.BackColor = [System.Drawing.Color]::White
$Button5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]7,[System.Int32]261))
$Button5.Name = [System.String]'Button5'
$Button5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]163,[System.Int32]26))
$Button5.TabIndex = [System.Int32]5
$Button5.Text = [System.String]'Disable Weak services'
$Button5.UseVisualStyleBackColor = $false
$Button5.add_Click($Button5_Click)
#
#Button6
#
$Button6.BackColor = [System.Drawing.Color]::White
$Button6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]7,[System.Int32]199))
$Button6.Name = [System.String]'Button6'
$Button6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]195,[System.Int32]25))
$Button6.TabIndex = [System.Int32]6
$Button6.Text = [System.String]'Changing Password Policies'
$Button6.UseVisualStyleBackColor = $false
$Button6.add_Click($Button6_Click)
#
#Button7
#
$Button7.BackColor = [System.Drawing.Color]::White
$Button7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]418))
$Button7.Name = [System.String]'Button7'
$Button7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]181,[System.Int32]26))
$Button7.TabIndex = [System.Int32]7
$Button7.Text = [System.String]'System Integrity Scan'
$Button7.UseVisualStyleBackColor = $false
$Button7.add_Click($Button7_Click)
#
#Button8
#
$Button8.BackColor = [System.Drawing.Color]::White
$Button8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]7,[System.Int32]230))
$Button8.Name = [System.String]'Button8'
$Button8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]199,[System.Int32]25))
$Button8.TabIndex = [System.Int32]8
$Button8.Text = [System.String]'PowerShell rootkit detection'
$Button8.UseVisualStyleBackColor = $false
$Button8.add_Click($Button8_Click)
#
#Button9
#
$Button9.BackColor = [System.Drawing.Color]::White
$Button9.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]104))
$Button9.Name = [System.String]'Button9'
$Button9.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]120,[System.Int32]28))
$Button9.TabIndex = [System.Int32]9
$Button9.Text = [System.String]'Find Image Files'
$Button9.UseVisualStyleBackColor = $false
$Button9.add_Click($Button9_Click)
#
#Button10
#
$Button10.BackColor = [System.Drawing.Color]::White
$Button10.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]42))
$Button10.Name = [System.String]'Button10'
$Button10.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]117,[System.Int32]25))
$Button10.TabIndex = [System.Int32]10
$Button10.Text = [System.String]'Brave Browser'
$Button10.UseVisualStyleBackColor = $false
$Button10.add_Click($Button10_Click)
#
#TextBox2
#
$TextBox2.BackColor = [System.Drawing.SystemColors]::GrayText
$TextBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$TextBox2.Name = [System.String]'TextBox2'
$TextBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]160,[System.Int32]24))
$TextBox2.TabIndex = [System.Int32]11
$TextBox2.Text = [System.String]'Other security programs'
#
#Button11
#
$Button11.BackColor = [System.Drawing.Color]::White
$Button11.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]73))
$Button11.Name = [System.String]'Button11'
$Button11.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]160,[System.Int32]25))
$Button11.TabIndex = [System.Int32]12
$Button11.Text = [System.String]'Bitdefender antivirus'
$Button11.UseVisualStyleBackColor = $false
$Button11.add_Click($Button11_Click)
#
#Button12
#
$Button12.BackColor = [System.Drawing.Color]::White
$Button12.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]42))
$Button12.Name = [System.String]'Button12'
$Button12.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150,[System.Int32]25))
$Button12.TabIndex = [System.Int32]13
$Button12.Text = [System.String]'Network connections'
$Button12.UseVisualStyleBackColor = $false
$Button12.add_Click($Button12_Click)
#
#Button13
#
$Button13.BackColor = [System.Drawing.Color]::White
$Button13.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]73))
$Button13.Name = [System.String]'Button13'
$Button13.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150,[System.Int32]25))
$Button13.TabIndex = [System.Int32]14
$Button13.Text = [System.String]'Programs/features'
$Button13.UseVisualStyleBackColor = $false
$Button13.add_Click($Button13_Click)
#
#TextBox3
#
$TextBox3.BackColor = [System.Drawing.SystemColors]::GrayText
$TextBox3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]167))
$TextBox3.Name = [System.String]'TextBox3'
$TextBox3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]110,[System.Int32]24))
$TextBox3.TabIndex = [System.Int32]15
$TextBox3.Text = [System.String]'Security settings'
#
#Button14
#
$Button14.BackColor = [System.Drawing.Color]::White
$Button14.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]138))
$Button14.Name = [System.String]'Button14'
$Button14.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]120,[System.Int32]23))
$Button14.TabIndex = [System.Int32]16
$Button14.Text = [System.String]'User accounts'
$Button14.UseVisualStyleBackColor = $false
$Button14.add_Click($Button14_Click)
#
#PictureBox1
#
$PictureBox1.BackgroundImage = ([System.Drawing.Image]$resources.'PictureBox1.BackgroundImage')
$PictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]314,[System.Int32]-1))
$PictureBox1.Name = [System.String]'PictureBox1'
$PictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]321,[System.Int32]320))
$PictureBox1.TabIndex = [System.Int32]17
$PictureBox1.TabStop = $false
#
#TextBox4
#
$TextBox4.BackColor = [System.Drawing.SystemColors]::ControlDarkDark
$TextBox4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]692,[System.Int32]541))
$TextBox4.Name = [System.String]'TextBox4'
$TextBox4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]151,[System.Int32]24))
$TextBox4.TabIndex = [System.Int32]18
$TextBox4.Text = [System.String]'Made By Moises Beleche'
$TextBox4.add_TextChanged($TextBox4_TextChanged)
#
#PictureBox2
#
$PictureBox2.BackgroundImage = ([System.Drawing.Image]$resources.'PictureBox2.BackgroundImage')
$PictureBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]418))
$PictureBox2.Name = [System.String]'PictureBox2'
$PictureBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150,[System.Int32]147))
$PictureBox2.TabIndex = [System.Int32]19
$PictureBox2.TabStop = $false
#
#Button15
#
$Button15.BackColor = [System.Drawing.Color]::White
$Button15.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]167))
$Button15.Name = [System.String]'Button15'
$Button15.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]129,[System.Int32]23))
$Button15.TabIndex = [System.Int32]20
$Button15.Text = [System.String]'List of processes'
$Button15.UseVisualStyleBackColor = $false
$Button15.add_Click($Button15_Click)
#
#Button16
#
$Button16.BackColor = [System.Drawing.Color]::White
$Button16.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]104))
$Button16.Name = [System.String]'Button16'
$Button16.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]123,[System.Int32]23))
$Button16.TabIndex = [System.Int32]21
$Button16.Text = [System.String]'Notepad++'
$Button16.UseVisualStyleBackColor = $false
$Button16.add_Click($Button16_Click)
#
#Button17
#
$Button17.BackColor = [System.Drawing.Color]::White
$Button17.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]133))
$Button17.Name = [System.String]'Button17'
$Button17.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]120,[System.Int32]23))
$Button17.TabIndex = [System.Int32]22
$Button17.Text = [System.String]'Portmaster'
$Button17.UseVisualStyleBackColor = $false
$Button17.add_Click($Button17_Click)
#
#Button18
#
$Button18.BackColor = [System.Drawing.Color]::White
$Button18.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]230))
$Button18.Name = [System.String]'Button18'
$Button18.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]80,[System.Int32]25))
$Button18.TabIndex = [System.Int32]23
$Button18.Text = [System.String]'VirusTotal'
$Button18.UseVisualStyleBackColor = $false
$Button18.add_Click($Button18_Click)
#
#Button19
#
$Button19.BackColor = [System.Drawing.Color]::White
$Button19.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]263))
$Button19.Name = [System.String]'Button19'
$Button19.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]80,[System.Int32]24))
$Button19.TabIndex = [System.Int32]24
$Button19.Text = [System.String]'Notes'
$Button19.UseVisualStyleBackColor = $false
$Button19.add_MouseClick($Button19_MouseClick)
#
#TextBox5
#
$TextBox5.BackColor = [System.Drawing.SystemColors]::GrayText
$TextBox5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]849,[System.Int32]200))
$TextBox5.Name = [System.String]'TextBox5'
$TextBox5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]66,[System.Int32]24))
$TextBox5.TabIndex = [System.Int32]25
$TextBox5.Text = [System.String]'Websites'
#
#Button20
#
$Button20.BackColor = [System.Drawing.Color]::White
$Button20.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]450))
$Button20.Name = [System.String]'Button20'
$Button20.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]122,[System.Int32]25))
$Button20.TabIndex = [System.Int32]26
$Button20.Text = [System.String]'Win Defender'
$Button20.UseVisualStyleBackColor = $false
$Button20.add_Click($Button20_Click)
#
#Form1
#
$Form1.BackColor = [System.Drawing.Color]::Black
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1011,[System.Int32]592))
$Form1.Controls.Add($Button20)
$Form1.Controls.Add($TextBox5)
$Form1.Controls.Add($Button19)
$Form1.Controls.Add($Button18)
$Form1.Controls.Add($Button17)
$Form1.Controls.Add($Button16)
$Form1.Controls.Add($Button15)
$Form1.Controls.Add($PictureBox2)
$Form1.Controls.Add($TextBox4)
$Form1.Controls.Add($PictureBox1)
$Form1.Controls.Add($Button14)
$Form1.Controls.Add($TextBox3)
$Form1.Controls.Add($Button13)
$Form1.Controls.Add($Button12)
$Form1.Controls.Add($Button11)
$Form1.Controls.Add($TextBox2)
$Form1.Controls.Add($Button10)
$Form1.Controls.Add($Button9)
$Form1.Controls.Add($Button8)
$Form1.Controls.Add($Button7)
$Form1.Controls.Add($Button6)
$Form1.Controls.Add($Button5)
$Form1.Controls.Add($Button4)
$Form1.Controls.Add($Button3)
$Form1.Controls.Add($TextBox1)
$Form1.Controls.Add($Button2)
$Form1.Controls.Add($Button1)
$Form1.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$Form1.Text = [System.String]'Cyber_ patriot'
([System.ComponentModel.ISupportInitialize]$PictureBox1).EndInit()
([System.ComponentModel.ISupportInitialize]$PictureBox2).EndInit()
$Form1.ResumeLayout($false)
$Form1.PerformLayout()
Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button2 -Value $Button2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox1 -Value $TextBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button3 -Value $Button3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button4 -Value $Button4 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button5 -Value $Button5 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button6 -Value $Button6 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button7 -Value $Button7 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button8 -Value $Button8 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button9 -Value $Button9 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button10 -Value $Button10 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox2 -Value $TextBox2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button11 -Value $Button11 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button12 -Value $Button12 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button13 -Value $Button13 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox3 -Value $TextBox3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button14 -Value $Button14 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name PictureBox1 -Value $PictureBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox4 -Value $TextBox4 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name PictureBox2 -Value $PictureBox2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button15 -Value $Button15 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button16 -Value $Button16 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button17 -Value $Button17 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button18 -Value $Button18 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button19 -Value $Button19 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox5 -Value $TextBox5 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button20 -Value $Button20 -MemberType NoteProperty
}
. InitializeComponent

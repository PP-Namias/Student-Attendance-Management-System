   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5      T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      @    :StudentAttendanceManagementSystem.ArchivedStudentsDatabase   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5      =local/clr-namespace:StudentAttendanceManagementSystem   5      LControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro   5      6src,http://metro.mahapps.com/winfx/xaml/controls  5	      -   5        ���#1A120B$X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5         MaterialDesignBody#���   5      $��Regular"�5      $��12(�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5      $	��800��5      $
��1050��5      $	��800��5      $
��1125��5       � 	Resources 5       �� MergedDictionaries �� Source �� 
TargetType  MaterialDesignTextBox �� BasedOn �� Property �� Value  MaterialDesignPasswordBox  MaterialDesignComboBox  MaterialDesignSlider�� 5   
    5      �� 5      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ComboBox.xaml?�6%   �� 5      $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Slider.xaml?�6%   �� 5      $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.TextBox.xaml?�6%   �� 5      $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Button.xaml?�6%   �� 5       $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Shadows.xaml?�6%   �� 5!      $l fpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ToggleButton.xaml?�6%   �� 5"      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.PopupBox.xaml?�6%   �� 5#      $i cpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.TextBlock.xaml?�6%   �� 5$      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.DataGrid.xaml?�6%   �� 5&      $o ipack://application:,,,/MaterialDesignColors;component/Themes/MaterialDesignColor.Green.Named.Primary.xaml?�6%   %p  '��       7  'G� R     7  '�� �     7  '(�     '�� �    7  �� 5(      " ��6   8   .�5)      ��  � ��$ 0 8 0 8q�6+   5*      �� 5+      " G�6   8   .�5,      ��  � ��$ 0 8 0 8q�6+   5-      �� 5.      " ��6   8   .�5/      ��  � ��$ Stretch=�68   �� 50       � ��$ 0 8 0 8q�6+   51      �� 52      " (�6   .�53      ��  � ��$ 18��6*   �� 54       � ��$ 18��6+   �� 55       � ��$ 0 0 8 0q�6+   �� 56       � ��$ Center=�66   57      �� 58      " ��6   8   .�59      ��  � ��$ 0 8 0 8q�6+   5:      5?      .��5B      � ���#1A120B.+�5C   
   �� $!��/Images/bg effects (13).png��6   $��UniformToFill=�65   �� 5D   
   	 �� Left$	 55��6   

 �� Top$
 30��5E   
   $	��700��5F   
   $��Center=�5G   
   $��1q�5H   
    �� CornerRadius$ 18��5I   
   $��	50,0,50,0q�5J   
   ��5K      L� 5L       j� Viewport$ 0,0,8,8�6    j� ViewportUnits$ Absolute=�62    j� TileMode$
 Tile=�6K    L� Drawing 5M      I� 5N      .��5O      �  � Brush
 ����� � Geometry 5P   "   � 5Q   &   .��5R   *   ��  �� Rect$ 	0,0,50,50�6<   �� 5S   *   $ 50,50,50,50�6<   5T   '   5V      5W      5Y      ._�5[      �� .+�5\      � -   5        $��	UserPages��5\   $   $��1��6   $��-51,-51,20,50q�65   
���   �6a   �� 5]      -   5        $��Title��5]      
�������$��0��6<   $��25q�6I   $��DemiBold"�6U   $��48(�6k   $	��706��6y   $
��Left=�6�   ARCHIVED STUDENT DATABASE6�   �� 5^      -   5         ��Name$ NumberOfLogs��5^      
�������$��DemiBold"�6E   $��22(�6[   $	��249��6i   $��700,-100,0,0q�6u   $��26��6�   �� 6�   $�Number of students: 000��6�   6�   �� 5_      $	 55��6   $
 30��5`      $	��500��5a      
�������$��1q�5c      $ 18��5d      $��50,-15,50,0q�5e      ._�5f      &   System.Windows.Controls.DataGrid  -   5          Name$ tblArchivedStudentRecords��5f      $��1��5g      ��. $
��Auto=�5i      $
��Auto=�5j         AutoGenerateColumns . $	��450��5l      $��Center=�5m      $	��885��5n         AlternatingRowBackground
 �����   CanUserAddRows .     
IsReadOnly .  K� ZIndex$ 3��5r         SelectionMode$ Single=�5s         SelectionUnit$ FullRow=�5t      5u      5v      �� 5y      -   5         ��Name$ btnUnarchive��5y       � ToolTip$ Archive Student Records��5z      ���#3C2A21+  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10��5|      
�������$��20(�5~      $	��218��5      $��60��5�      $��Center=�5�       � Cursor$
 Hand��5�      
�������$��1q�5�      $��Century Gothic)�5�      $
��Bold"�5�      $��-700,15,0,0q�5�      .��5�      � $��Center=�6    .+�5�      '  !MaterialDesignThemes.Wpf.PackIcon      Kind$  ArchivePlus=�5�      $��45��5�      $��45��5�      �� 5�      $��| Unarchive��6$   $��Center=�5�   $   $��SemiBold"�5�   $   $
��10 0q�5�   $   5�      5�      �� 5�      -   5        $ btnSave��5�      $ Save Student Records��5�      ���#3C2A21$ 10��5�      
�������$��20(�5�      $��60��5�      $��60��5�      $��Center=�5�      $
 Hand��5�      
�������$��1q�5�      $��Century Gothic)�5�      $
��Bold"�5�      $��700,-60,0,0q�5�      $��0,0,0,0q�5�   /   .��5�      � $��Center=�6    .+�5�        $  ContentSave=�5�      $��45��5�      $��45��5�      5�      5�      �� 5�      -   5        $ 
btnRefresh��5�      $ Refresh Student Records��5�      ���#3C2A21$ 10��5�      
�������$��20(�5�      $��60��5�      $��60��5�      $��Center=�5�      $
 Hand��5�      
�������$��1q�5�      $��Century Gothic)�5�      $
��Bold"�5�      $��850,-60,0,0q�5�      $��0,0,0,0q�5�   2   .��5�      � $��Center=�6    .+�5�        $  RefreshCircle=�5�      $��45��5�      $��45��5�      5�      5�      �� 5�      -	   5        $ btnOpenArchived��5�      $# Show Archived Student Records��5�      ���#3C2A21$ 10��5�      
�������$��20(�5�      $	��218��5�      $��60��5�      $��Center=�5�      $
 Hand��5�      
�������$��1q�5�      $��Century Gothic)�5�      $
��Bold"�5�      $��-235,-60,0,0q�5�      $��0,0,0,0q�5�      .��5�      � $��Center=�6    $	��202��6=   .+�5�        $
  Hide=�5�      $��45��5�      $��45��5�      �� 5�      $��| Close Archive��6$   $��Center=�5�   $   $��SemiBold"�5�   $   $	��0 0q�5�   $   5�      5�      5�      5�      5�      5�      
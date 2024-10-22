﻿#pragma checksum "..\..\ArchiveLoginLogs.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "91BC7A630E069BD79ADB25F616B6B0C931716F1DC2F9A984FAB9F545EEFE43BE"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using MahApps.Metro;
using MahApps.Metro.Accessibility;
using MahApps.Metro.Actions;
using MahApps.Metro.Automation.Peers;
using MahApps.Metro.Behaviors;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using MahApps.Metro.Converters;
using MahApps.Metro.Markup;
using MahApps.Metro.Theming;
using MahApps.Metro.ValueBoxes;
using MaterialDesignThemes.MahApps;
using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using StudentAttendanceManagementSystem;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace StudentAttendanceManagementSystem {
    
    
    /// <summary>
    /// ArchiveLoginLogs
    /// </summary>
    public partial class ArchiveLoginLogs : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 91 "..\..\ArchiveLoginLogs.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid UserPages;
        
        #line default
        #line hidden
        
        
        #line 92 "..\..\ArchiveLoginLogs.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock Title;
        
        #line default
        #line hidden
        
        
        #line 93 "..\..\ArchiveLoginLogs.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock NumberOfLogs;
        
        #line default
        #line hidden
        
        
        #line 102 "..\..\ArchiveLoginLogs.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid tblArchivedLogs;
        
        #line default
        #line hidden
        
        
        #line 120 "..\..\ArchiveLoginLogs.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnUnarchive;
        
        #line default
        #line hidden
        
        
        #line 149 "..\..\ArchiveLoginLogs.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnRefresh;
        
        #line default
        #line hidden
        
        
        #line 177 "..\..\ArchiveLoginLogs.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnOpenArchive;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Student Attendance Management System;component/archiveloginlogs.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\ArchiveLoginLogs.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.UserPages = ((System.Windows.Controls.Grid)(target));
            return;
            case 2:
            this.Title = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 3:
            this.NumberOfLogs = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.tblArchivedLogs = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 5:
            this.btnUnarchive = ((System.Windows.Controls.Button)(target));
            
            #line 135 "..\..\ArchiveLoginLogs.xaml"
            this.btnUnarchive.Click += new System.Windows.RoutedEventHandler(this.btnUnarchive_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.btnRefresh = ((System.Windows.Controls.Button)(target));
            
            #line 164 "..\..\ArchiveLoginLogs.xaml"
            this.btnRefresh.Click += new System.Windows.RoutedEventHandler(this.btnRefresh_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.btnOpenArchive = ((System.Windows.Controls.Button)(target));
            
            #line 192 "..\..\ArchiveLoginLogs.xaml"
            this.btnOpenArchive.Click += new System.Windows.RoutedEventHandler(this.btnOpenArchive_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}


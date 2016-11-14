%define appname ekzekuto

Name: org.example.ekzekuto
Version: 1.0.2
Release: 0
Summary: Ekzekuto application
URL: http://github.com/rzr/ekzekuto
Source: %{name}-%{version}.tar.gz
Source1001: %{appname}.manifest
License: Apache-2.0
Group: tizen/Application

%define prefix /usr/apps/%{name}

%if ! %{?license:0}
%define license %doc
%endif

BuildRequires: cmake
BuildRequires: embryo-bin
BuildRequires: gettext-tools
BuildRequires: pkgconfig(appcore-common)
BuildRequires: pkgconfig(appcore-efl)
BuildRequires: pkgconfig(capi-appfw-application)
BuildRequires: pkgconfig(capi-system-system-settings)
BuildRequires: pkgconfig(dlog)
BuildRequires: pkgconfig(ecore)
BuildRequires: pkgconfig(efl-extension)
BuildRequires: pkgconfig(elementary)
BuildRequires: pkgconfig(embryo)
BuildRequires: pkgconfig(feedback)
BuildRequires: pkgconfig(glib-2.0)
BuildRequires: pkgconfig(vconf)

%description
Ekzekutor application

%prep
%setup -q
cp %{SOURCE1001} ./%{name}.manifest

%build

LDFLAGS+="-Wl,--rpath=%{prefix}/lib -Wl,--as-needed -Wl,--hash-style=both"
export LDFLAGS

cmake . -DCMAKE_INSTALL_PREFIX="%{prefix}"

make %{?jobs:-j%jobs}

%install
rm -rf %{buildroot}
%make_install

%files
%defattr(-,root,root,-)
%attr(-,inhouse,inhouse)
%license LICENSE
%manifest %{name}.manifest
%{_datadir}/packages/%{name}.xml
%{prefix}/bin/%{appname}
%{prefix}/res/icons/%{name}.png
%{_datadir}/icons/default/small/%{name}.png


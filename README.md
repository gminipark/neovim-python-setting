# Ubuntu Neovim setting for Python(conda) 

`Pycharm`과 `Jupyter notebook`의 불편함의 대안으로 `Neovim`을 사용하여 Python 개발 환경 구축

### __Pycharm__ 문제점
- local computer마다 `Pycharm` 설치 + remote server connection
- code synchronization(동기화)

### __Jupyter notebook__ & __Jupter lab__ 문제점
- .ipynb을 .py로 계속 변경(큰 프로젝트에서 불편)
- port도 고려

### Why __Neovim__?
conda 환경에서 Neovim은 자으로 python 경로를 인식하는 반면 Vim은 이용해서 python 경로를 인식 못함 

### Environment
- Ubuntu 16.04
- Python 3.6
- conda 

### Installation
####  1.CMake
- - -
youcompleteme를 사용할려면 `cmake` 특정 버전 이상 필요
~~apt install cmake~~ 낮은 버전의 `cmake` 설치됨
- - -
open ssl 필요
```bash
sudo apt install libssl-dev 
sudo apt install build-essential
```
- - -
CMake 설치
[CMake](https://cmake.org/download/) 공식 홈페이지 다운로드
```bash
wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3.tar.gz # version check
tar -xvf cmake-3.21.3.tar.gz
cd cmake-3.21.3
./bootstrap
make
make install
```

#### 3. GCC & G++
- - - 
gcc & g++ 
```bash
sudo add-apt-repository ppa:ubuntu-toolchain-r/test 
sudo apt update
apt install gcc-8 g++-8 # check gcc & g++ version compatible with cmake & youcompleteme
```
- - -
gcc & g++ version 우선순위 설정
```bash
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50 # old version gcc
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 50 # old version g++
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 80

update-alternatives --config gcc
update-alternatives --config g++
```
- - -

#### 4. Neovim
- - -
[Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) 공식 설치 사이트 
Neovim 설치 
```
sudo add-apt-repository ppa:neovim-ppa/unstable # neovim 0.5.0 이상 사용해야 ycm 사용가능 
sudo apt-get update
sudo apt-get install neovim
```
- - -
Neovim python support
```bash
sudo apt-get install python-software-properties
```

```bash
sudo apt-get install python-dev python-pip python3-dev
sudo apt-get install python3-setuptools
sudo easy_install3 pip
```
```bash
pip install neovim && \
pip3 install neovim 
```
python provider 연동 확인
```bash
nvim +checkhealth
```

vi & vim & editor mapping
```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```
- - -
##### Plugin 설치

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim # check directory path
```

init.vim 아래 경로에 복사
```~/.config/nvim/init.vim```

vundle 설치
```bash
cd ~/.config/nvim/
nvim init.vim
```
```:PluninInstall``` 으로 설치

##### Youcompleteme 설치
현재 경로 ```~/.config/nvim/```
Neovim 설정에 맞게 youcompleme config 파일 경로 이동
```bash
cp bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py ./
```
YoucompleteMe 설치
```bash
cd bundle/YoucompleteMe
./install.py --clangd-completer # 여러가지 언어를 지원하지만 c언어만 지원하게 설치
```

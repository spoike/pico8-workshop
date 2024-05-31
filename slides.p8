pico-8 cartridge // http://www.pico-8.com
version 37
__lua__
-- knowabunga workshop 2022

function _init()
 cartdata("spoike_kb_2022")
 switch_to(dget(0))
 revealed=dget(1)
end

function switch_to(i)
 current_page=mid(1,i,#slides)
 dset(0,current_page)
 revealed=0
 current=slides[current_page] 
end

function _draw()
 draw_slide()
end

function _update()
 update_slide()
end

function draw_slide()
 cls(current.bg)
 if current.header then
  printc(current.header, 2, 
   current.headercol or 7,true)
 end
 if current.center then
  printc(current.center, 60, 
   current.headercol or 7,true)
 end
 if current.points then
  for i,p in
   pairs(current.points) do
   printp(i,p,2+(i*2),7)
  end
 end
end

function update_slide()
 if btnp(0) then
  -- previous slide
  revealed=0
  dset(1, revealed)
  switch_to(current_page-1)
 elseif btnp(1) then
  -- next slide
  revealed=0
  dset(1, revealed)
  switch_to(current_page+1)
 elseif btnp(2) then
  revealed-=1
  dset(1, revealed)
 elseif btnp(3) then
  revealed+=1
  dset(1, revealed)
 end
end

function printc(s,y,col,shadow)
 if y<12 then
  y=y*8
 end
 if shadow then
  print(s, 64-(#s*2), y+1, 0)
 end
 print(s, 64-(#s*2), y, col)
end

function printp(i,s,y,col)
 if revealed>=i then
  print(s,8,y*8,col)
 end
end
-->8
slides={
 {
  center="pico 8 workshop!",
  headercol=8
 },
 {
  center="woo!",
  headercol=8
 },
 {
  center="intro to the workshop",
 },
 {
  header="★ da rules ★",
  headercol=8,
  points={
   "material online (2hrs)",
   "you may come and go (drop-in)",
   "come to boole for help",
   "experiment a lot"
  }
 },
 {
  header="what is pico8?",
  points={
   "★ virtual console with carts",
   "★ fun and cute",
   [[★ has a bunch of built-in
   tools you can use]]
  }
 },
 {
  header="virtual console limits",
  headercol=14,
  points={
   "128 x 128 pixels",
   "16 colors",
   "4 sound channels",
   "8192 tokens, 65k chars",
   "64 kIb addressable memory"
  }
 },
 {
  header="fun and cute",
  headercol=14,
  points={
   "great community",
   "bbs / splore",
   "png cartridges",
   "exports to web and binaries"
  }
 },
 {
  header="inspirations!",
  headercol=14,
  points={
   "★ splore",
   "★ tweetcarts",
   "★ picocad"
  }
 },
 {
  bg=13,
  headercol=10,
  center="questions?"
 },
 {
  headercol=10,
  header="workshop begins",
  points={
  [[     workshop materials

             at
  
 https://github.com/spoike/
        pico8-workshop
        
       #tribes-gamedev]]}
 }
}
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

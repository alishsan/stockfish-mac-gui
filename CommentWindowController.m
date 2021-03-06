/*
  Stockfish, a OS X GUI for the UCI chess engine with the same name.
  Copyright (C) 2004-2011 Marco Costalba, Joona Kiiski, Tord Romstad

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#import "BoardController.h"
#import "CommentWindowController.h"
#import "ChessMove.h"

@implementation CommentWindowController

-(id)initWithMove:(ChessMove *)aMove 
  boardController:(BoardController *)aBoardController {
  self = [super initWithWindowNibName: @"CommentWindow"];
  move = [aMove retain];
  boardController = [aBoardController retain];
  if([move comment])
    [textView setString: [move comment]];
  return self;
}

-(void)windowDidLoad {
  if([move comment])
    [textView setString: [move comment]];
}

-(IBAction)okButtonPressed:(id)sender {
  [move setComment: 
          [[textView string] 
            stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceAndNewlineCharacterSet]]];
  [boardController displayMoveList];
  [[self window] close];
}

-(IBAction)cancelButtonPressed:(id)sender {
  [[self window] close];
}

-(void)dealloc {
  [move release];
  [boardController release];
  [super dealloc];
}

@end

package com.databigbang.articles;

class StreamOrientedKnuthMorrisPratt {
	var m: Int;
	var i: Int;
	var ss: String;
	var table: Array<Int>;

	public function new(ss: String) {
		this.ss = ss;
		this.buildTable(this.ss);
	}

	public function begin() : Void {
		this.m = 0;
		this.i = 0;
	}

	public function partialSearch(s: String) : Int {
		var offset = this.m + this.i;

		while(this.m + this.i - offset < s.length) {
			if(this.ss.substr(this.i, 1) == s.substr(this.m + this.i - offset,1)) {
				if(this.i == this.ss.length - 1) {
					return this.m;
				}
				this.i += 1;
			} else {
				this.m += this.i - this.table[this.i];
				if(this.table[this.i] > -1)
					this.i = this.table[this.i];
				else
					this.i = 0;
			}
		}

		return -1;
	}

	private function buildTable(ss: String) : Void {
		var pos = 2;
		var cnd = 0;

		this.table = new Array<Int>();
		if(ss.length > 2)
			this.table.insert(ss.length, 0);
		else
			this.table.insert(2, 0);

		this.table[0] = -1;
		this.table[1] = 0;

		while(pos < ss.length) {
			if(ss.substr(pos-1,1) == ss.substr(cnd, 1))
			{
				cnd += 1;
				this.table[pos] = cnd;
				pos += 1;
			} else if(cnd > 0) {
				cnd = this.table[cnd];
			} else {
				this.table[pos] = 0;
				pos += 1;
			}
		}
	}

	public static function main() {
		var KMP = new StreamOrientedKnuthMorrisPratt("aa");
		KMP.begin();
		trace(KMP.partialSearch("ccaabb"));

		KMP.begin();
		trace(KMP.partialSearch("ccarbb"));
		trace(KMP.partialSearch("lksjaabof"));		

	}
}

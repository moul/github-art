// Generated by CoffeeScript 1.4.0
(function() {
  var call, fs, pth, system, _ref,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  _ref = require('./utils'), call = _ref.call, system = _ref.system;

  pth = require('path');

  fs = require('fs');

  module.exports.Repos = (function() {

    function Repos(opts, fn) {
      var _base, _ref1;
      this.opts = opts != null ? opts : {};
      if (fn == null) {
        fn = null;
      }
      this.commit = __bind(this.commit, this);

      this.add = __bind(this.add, this);

      this.push = __bind(this.push, this);

      this._setupRemote = __bind(this._setupRemote, this);

      this._init = __bind(this._init, this);

      this.init = __bind(this.init, this);

      this.exec = __bind(this.exec, this);

      this.createFile = __bind(this.createFile, this);

      if ((_ref1 = (_base = this.opts).bin) == null) {
        _base.bin = 'git';
      }
      if (fn) {
        fn(false, this);
      }
      return this;
    }

    Repos.prototype.createFile = function(filename, content, fn) {
      if (content == null) {
        content = '';
      }
      if (fn == null) {
        fn = null;
      }
      return fs.writeFile(filename, content, 'utf-8', fn);
    };

    Repos.prototype.exec = function(cmd, fn) {
      if (cmd == null) {
        cmd = [];
      }
      if (fn == null) {
        fn = null;
      }
      return call(cmd[0], cmd.slice(1), fn);
    };

    Repos.prototype.init = function(fn) {
      var _this = this;
      if (fn == null) {
        fn = null;
      }
      if (this.opts["new"]) {
        return this.exec(['rm', '-rf', pth.join(this.opts.path, '.git')], function(err, stdout, stderr) {
          if (err) {
            return fn(err, stdout, stderr);
          }
          return _this._init(_this.opts.path, fn);
        });
      } else {
        return this._init(this.opts.path, fn);
      }
    };

    Repos.prototype._init = function(path, fn) {
      var _this = this;
      if (fn == null) {
        fn = null;
      }
      return this.exec([this.opts.bin, 'init', path], function(err, stdout, stderr) {
        if (err) {
          return fn(err, stdout, stderr);
        }
        if (_this.opts.origin) {
          return _this._setupRemote('origin', _this.opts.origin, fn);
        } else {
          return fn(err, stdout, stderr);
        }
      });
    };

    Repos.prototype._setupRemote = function(remoteName, url, fn) {
      if (fn == null) {
        fn = null;
      }
      return this.exec([this.opts.bin, 'remote', 'add', remoteName, url], fn);
    };

    Repos.prototype.push = function(fn) {
      if (fn == null) {
        fn = null;
      }
      return this.exec([this.opts.bin, 'push', '--force', '-u', 'origin', 'master'], fn);
    };

    Repos.prototype.add = function(path, fn) {
      if (path == null) {
        path = '.';
      }
      if (fn == null) {
        fn = null;
      }
      return this.exec([this.opts.bin, 'add', pth.join(this.opts.path, path)], fn);
    };

    Repos.prototype.commit = function(opts, fn) {
      var _ref1, _ref2;
      if (opts == null) {
        opts = {};
      }
      if (fn == null) {
        fn = null;
      }
      if ((_ref1 = opts.message) == null) {
        opts.message = '.';
      }
      if ((_ref2 = opts.date) == null) {
        opts.date = new Date;
      }
      return this.exec([this.opts.bin, 'commit', '-m', opts.message, '--date', opts.date], fn);
    };

    return Repos;

  })();

}).call(this);
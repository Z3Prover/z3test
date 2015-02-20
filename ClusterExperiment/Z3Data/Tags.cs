using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Z3Data
{
    public class Tags
    {
        protected Dictionary<string, uint> _tags = new Dictionary<string, uint>();
        protected Dictionary<uint, string> _ids = new Dictionary<uint, string>();

        public Tags()
        {
        }

        public void Insert(string name, uint id)
        {
            if (_tags.ContainsKey(name))
            {
                _tags[name] = id;
                _ids[id] = name;
            }
            else
            {
                _tags.Add(name, id);
                _ids.Add(id, name);
            }
        }

        public Dictionary<string, uint>.Enumerator GetEnumerator()
        {
            return _tags.GetEnumerator();
        }

        public bool HasTag(uint id)
        {
            return _ids.ContainsKey(id);
        }

        public bool HasTag(string tag)
        {
            return _tags.ContainsKey(tag);
        }
        
        public bool HasID(string id)
        {
            return _ids.ContainsKey(Convert.ToUInt32(id));
        }

        public bool HasID(uint id)
        {
            return _ids.ContainsKey(id);
        }

        public string Get(uint id)
        {
            if (_ids.ContainsKey(id))
                return _ids[id];
            else
                throw new Exception("ID not in dictionary.");
        }

        public uint Get(string name)
        {
            if (_tags.ContainsKey(name))
                return _tags[name];
            else
                throw new Exception("Tag not in dictionary.");
        }

        public string Name(Job j)
        {
            if (HasTag(j.MetaData.Id))
                return _ids[j.MetaData.Id];
            else
                return "#" + j.MetaData.Id.ToString();
        }
    }
}
